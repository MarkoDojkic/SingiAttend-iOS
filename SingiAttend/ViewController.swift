//
//  ViewController.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 14.8.20..
//  Copyright © 2020. Марко Дојкић. All rights reserved.
//

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Main") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}

extension UIStackView {
    func removeAllSubviews() {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
}

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
}

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

public func communicateWithServer(_ message:String, _ sleep_time:Int) -> String {
    return "error 404"
    /*let socket = TCPClient(address: "192.168.8.105", port: 21682)
    switch socket.connect(timeout: 1){
    case .success:
        switch socket.send(string: message){
        case .success:
            sleep(UInt32(sleep_time))
            guard let sData = socket.read(1024*100) else {
                _ = SweetAlert().showAlert("serverTitleError".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                switch socket.send(string: "END"){
                case .success: print("successfuly disconnected from server without response")
                case .failure(let error):
                    print(error)
                }
                return "error 404"
            }
            if let response = String(bytes: sData, encoding: .utf8) {
                switch socket.send(string: "END"){
                case .success: print("successfuly disconnected from server")
                case .failure(let error):
                    print(error)
                }
                return response
            }
        case .failure(let error): print(error)
        }
    case .failure(let error): print(error)
    }
    
    return "error 300"*/
}

import UIKit
import Charts

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleMain_text: UILabel!
    @IBOutlet weak var copyright_text: UILabel!
    @IBOutlet weak var loggedInAs_text: UILabel!
    @IBOutlet weak var logout_btn: UIButton!
    @IBOutlet var loginPopup: UIView!
    @IBOutlet weak var indexLogin_text: UILabel!
    @IBOutlet weak var indexLogin_txt: UITextField!
    @IBOutlet weak var passLogin_text: UILabel!
    @IBOutlet weak var passLogin_txt: UITextField!
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var overlay: UIImageView!
    @IBOutlet weak var courses_tv: UITableView!
    let localStorage = UserDefaults.standard
    var courses = [[String]]()
    var attendances = [[String]]()
    @IBOutlet weak var attendances_pcv: PieChartView!
    @IBOutlet weak var attendances_class_text: UILabel!
    @IBOutlet weak var attendances_prognosis_text: UILabel!
    @IBOutlet weak var attendanceLeft_btn: UIButton!
    @IBOutlet weak var attendanceRight_btn: UIButton!
    var attendend = PieChartDataEntry(value: 0)
    var notAttended = PieChartDataEntry(value: 0)
    var currentAttendanceLecture = 0
    var updateTimer: Timer!
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        titleMain_text.text = "title_main".localized()
        copyright_text.text = "copyright".localized()
        logout_btn.setTitle("logout".localized(), for: UIControl.State.normal)
        indexLogin_text.text = "br_indexa".localized()
        indexLogin_txt.placeholder = "hint_index".localized()
        passLogin_text.text = "password".localized()
        passLogin_txt.placeholder = "hint_pass".localized()
        register_btn.setTitle("register".localized(), for: UIControl.State.normal)
        login_btn.setTitle("login".localized(), for: UIControl.State.normal)
        login_btn.layer.cornerRadius = 10
        register_btn.layer.cornerRadius = 10
        logout_btn.layer.cornerRadius = 10
        self.view.addSubview(loginPopup);
        loginPopup.center = self.view.center
        loginPopup.backgroundColor = UIColor.lightGray
        loginPopup.layer.cornerRadius = 18
        courses_tv.dataSource = self
        courses_tv.rowHeight = 80
        
        if(!localStorage.bool(forKey: "isLoggedIn")){
            overlay.isHidden = false
            loginPopup.isHidden = false
            loggedInAs_text.isHidden = true
            logout_btn.isHidden = true
            courses_tv.isHidden = true
            attendances_pcv.isHidden = true
            attendanceLeft_btn.isHidden = true
            attendanceRight_btn.isHidden = true
            attendances_class_text.isHidden = true
            attendances_prognosis_text.isHidden = true
            
        }
        else{
            overlay.isHidden = true
            loginPopup.isHidden = true
            loggedInAs_text.isHidden = false
            logout_btn.isHidden = false
            courses_tv.isHidden = false
            attendances_pcv.isHidden = false
            attendanceLeft_btn.isHidden = false
            attendanceRight_btn.isHidden = false
            attendances_class_text.isHidden = false
            attendances_prognosis_text.isHidden = false
            startDataStreaming(0)
            startDataStreaming(1)
            startDataStreaming(2)
            updateTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(reloadTable), userInfo: nil, repeats: true)
            attendanceLeft_btn.alpha = 0
            attendanceLeft_btn.isUserInteractionEnabled = false
            if(currentAttendanceLecture == attendances.count - 1){
                attendanceRight_btn.alpha = 0
                attendanceRight_btn.isUserInteractionEnabled = false
            }
        }
    }
    
    @IBAction func checkIndex(_ sender: Any) {
        if(indexLogin_txt.text!.count == 5 && indexLogin_txt.text?.last != "/"){
            indexLogin_txt.text!.insert("/", at: indexLogin_txt.text!.index(before: indexLogin_txt.text!.endIndex))
        }
    }
    
    @IBAction func attendance_goLeft(_ sender: UIButton!) {
        currentAttendanceLecture = currentAttendanceLecture - 1
        if(currentAttendanceLecture == attendances.count - 2){
            attendanceRight_btn.alpha = 1
            attendanceRight_btn.isUserInteractionEnabled = true
        }
        if(currentAttendanceLecture == 0){
            sender.alpha = 0
            sender.isUserInteractionEnabled = false
        }
        updatePieChart()
    }
    
    @IBAction func attendance_goRight(_ sender: UIButton!) {
        currentAttendanceLecture = currentAttendanceLecture + 1
        if(currentAttendanceLecture == 1){
            attendanceLeft_btn.alpha = 1
            attendanceLeft_btn.isUserInteractionEnabled = true
        }
        if(currentAttendanceLecture == attendances.count - 1){
            sender.alpha = 0
            sender.isUserInteractionEnabled = false
        }
        updatePieChart()
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        let cData = "CHECKLOGIN," + indexLogin_txt.text! + "?" + passLogin_txt.text!
        let response = communicateWithServer(cData,2)
        print(response)
        if(response == "VALID\n"){
            _ = SweetAlert().showAlert("loginTitleSuccess".localized(), subTitle: "", style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in
                if isOtherButton == true {
                    self.localStorage.set(true, forKey:"isLoggedIn")
                    self.localStorage.set(self.indexLogin_txt.text!, forKey: "loggedInAs")
                    self.startDataStreaming(0)
                    self.overlay.isHidden = true
                    self.loginPopup.isHidden = true
                    self.loggedInAs_text.isHidden = false
                    self.logout_btn.isHidden = false
                    self.courses_tv.isHidden = false
                }
            }
        }
        else if(response == "INVALID\n"){
            _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
        }
        else {
            _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
        }
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegister", sender: sender)
    }
    
    @IBAction func onLogout(_ sender: UIButton) {
        localStorage.set(false, forKey:"isLoggedIn")
        localStorage.set("", forKey: "loggedInAs")
        overlay.isHidden = false
        loginPopup.isHidden = false
        loggedInAs_text.isHidden = true
        logout_btn.isHidden = true
        courses_tv.isHidden = true
        attendances_pcv.isHidden = true
        attendanceLeft_btn.isHidden = true
        attendanceRight_btn.isHidden = true
        attendances_class_text.isHidden = true
        attendances_prognosis_text.isHidden = true
        updateTimer.invalidate()
    }
    
    @objc func startDataStreaming(_ type: Int){
        if(type == 0){
            let cData = "GETUSERINFO," + localStorage.string(forKey: "loggedInAs")!
            let response = communicateWithServer(cData,2)
            loggedInAs_text.text = response + "(" + localStorage.string(forKey: "loggedInAs")! + ")"
            loggedInAs_text.adjustsFontSizeToFitWidth = true;
            self.startDataStreaming(1)
        }
        else if(type == 1){
            let cData = "GETCOURSEDATA," + localStorage.string(forKey: "loggedInAs")!
            let coursesData_json = try! JSONSerialization.jsonObject(with: communicateWithServer(cData,2).data(using: String.Encoding.utf8)!, options: []) as? [[String:Any]]
            
            courses.removeAll()
            
            for course in coursesData_json!{
                var newCourseData = [String]()
                
                if(Locale.current.languageCode == "sr"){
                    newCourseData.append((course["predmet"] as! String))
                }
                else{ newCourseData.append((course["predmet_eng"] as! String)) }
                
                newCourseData.append((course["nameSurnameT"] as! String))
                newCourseData.append((course["nameSurnameA"] as? String ?? ""))
                newCourseData.append((course["begin_time"] as! String))
                newCourseData.append((course["end_time"] as! String))
                newCourseData.append((course["course_id"] as! String))
                
                courses.append(newCourseData)
            }
            
            courses_tv.reloadData()
        }
        else if(type == 2){
            let cData = "GETATTENDANCESDATA," + localStorage.string(forKey: "loggedInAs")!
            let attendanceData_json = try! JSONSerialization.jsonObject(with: communicateWithServer(cData,2).data(using: String.Encoding.utf8)!, options: []) as? [[String:Any]]
            
            attendances.removeAll()
            
            for course in attendanceData_json!{
                var newAttendanceData = [String]()
                
                if(Locale.current.languageCode == "sr"){
                    newAttendanceData.append((course["predmet"] as! String))
                }
                else{ newAttendanceData.append((course["predmet_eng"] as! String)) }
                
                newAttendanceData.append((course["nameSurnameT"] as! String))
                newAttendanceData.append((course["nameSurnameA"] as? String ?? ""))
                newAttendanceData.append((course["attendedLectures"] as! String))
                newAttendanceData.append((course["totalLectures"] as! String))
                newAttendanceData.append((course["isLectureEnded"] as! String))
                
                attendances.append(newAttendanceData)
            }
            
            updatePieChart()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cellIndetifier = "SingleCourseCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath) as? SingleCourseCell else {
            fatalError("The dequeued cell is not an instance of SingleCourseCell.")
        }
        
        cell.class_text.text = courses[indexPath.row][0]
            + "\n" + courses[indexPath.row][1]
            + ( courses[indexPath.row][2].isEmpty ? "" : ("\n" + courses[indexPath.row][2]) )
            + "\n" + courses[indexPath.row][3] + " - " + courses[indexPath.row][4] + ")"
        cell.cconfirm_btn.tag = Int(courses[indexPath.row][5])!
        
        return cell
    }
    
    @objc func reloadTable(){
        self.startDataStreaming(1)
        self.startDataStreaming(2)
        print("***Courses reloaded***")
    }
    
    func updatePieChart(){
        
        if(self.attendances_pcv.isHidden && !attendances.isEmpty){
            self.attendances_pcv.isHidden = false
            self.attendanceLeft_btn.isHidden = false
            self.attendanceRight_btn.isHidden = false
            self.attendances_class_text.isHidden = false
            self.attendances_prognosis_text.isHidden = false
        }
        
        let percentage = Double(attendances[currentAttendanceLecture][3])! / Double(attendances[currentAttendanceLecture][4])! * 100.0
        attendances_pcv.centerText = String(percentage) + "% \n" + attendances[currentAttendanceLecture][3] + "/" + attendances[currentAttendanceLecture][4]

        attendances_pcv.legend.enabled = false
        attendances_pcv.isUserInteractionEnabled = false
        attendend.value = Double(attendances[currentAttendanceLecture][3])!
        attendend.label = nil
        
        notAttended.value = Double(attendances[currentAttendanceLecture][4])! - Double(attendances[currentAttendanceLecture][3])!
        notAttended.label = nil
        
        let chartDataSet = PieChartDataSet(entries: [attendend,notAttended], label: nil)
        chartDataSet.colors = [UIColor.green,UIColor.red]
        chartDataSet.drawValuesEnabled = false
        attendances_pcv.data = PieChartData(dataSet: chartDataSet)
        
        attendances_class_text.text = attendances[currentAttendanceLecture][0]
            + "\n" + attendances[currentAttendanceLecture][1]
            + ( attendances[currentAttendanceLecture][2].isEmpty ? "" : ("\n(" + attendances[currentAttendanceLecture][2] + ")") )
        
        if(Locale.current.languageCode == "sr"){
            attendances_prognosis_text.text = "Прогноза бодова за присуство: " + String(Int(10.0*Double(attendances[currentAttendanceLecture][3])!/Double(attendances[currentAttendanceLecture][4])!)) + "/10"
            if(attendances[currentAttendanceLecture][5] == "1"){
                attendances_prognosis_text.text = attendances_prognosis_text.text! + "\n (КРАЈ НАСТАВЕ)"
            }
            
        }
        else {
            attendances_prognosis_text.text = "Forecast points for attendance: " + String(Int(10.0*Double(attendances[currentAttendanceLecture][3])!/Double(attendances[currentAttendanceLecture][4])!)) + "/10"
            if(attendances[currentAttendanceLecture][5] == "1"){
                attendances_prognosis_text.text = attendances_prognosis_text.text! + "\n (LECTURES ARE OVER)"
            }
        }
    }
}
