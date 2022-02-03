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
    @IBOutlet weak var serverInacitve_text: UILabel!
    var attendendL = PieChartDataEntry(value: 0)
    var notAttendedL = PieChartDataEntry(value: 0)
    var attendendP = PieChartDataEntry(value: 0)
    var notAttendedP = PieChartDataEntry(value: 0)
    var currentAttendanceLecture = 0
    var updateTimer: Timer!
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        titleMain_text.text = "title_main".localized()
        copyright_text.text = "copyright".localized()
        logout_btn.setTitle("logout".localized(), for: UIControl.State.normal)
        indexLogin_text.text = "br_indexa".localized()
        indexLogin_txt.placeholder = "hint_index_login".localized()
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
        else {
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
        login((indexLogin_txt.text?.replacingOccurrences(of: "/", with: ""))!, (passLogin_txt.text?.data(using: .utf8))!, completionHandler: {
            response in
            if let message = response {
                DispatchQueue.main.async { //To fix Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread
                    if(message == "VALID"){
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
                    else if(message == "INVALID"){
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                    }
                    else if(message == "UNKNOWN"){
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageUnknown".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                    }
                    else {
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                    }
                }
            }
        })
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
            var request = URLRequest(url: URL(string: "http://192.168.8.105:62812/api/getStudentName/" + localStorage.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: ""))!)
            request.httpMethod = "GET"
            request.setValue("text/plain", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", "singiattend-admin","singiattend-server2021").data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student name data: \(error)")
                    DispatchQueue.main.async {
                        self.loggedInAs_text.text = "(" + self.localStorage.string(forKey: "loggedInAs")! + ")";
                        self.serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.async { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        DispatchQueue.main.async {
                            self.loggedInAs_text.text = "-SERVER ERROR- (" + self.localStorage.string(forKey: "loggedInAs")! + ")"
                            self.loggedInAs_text.adjustsFontSizeToFitWidth = true;
                        }
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        self.loggedInAs_text.text = String(data: data, encoding: .utf8)! + " (" + self.localStorage.string(forKey: "loggedInAs")! + ")"
                        self.loggedInAs_text.adjustsFontSizeToFitWidth = true;
                        self.startDataStreaming(1);
                    }
                }
            }.resume()
        }
        else if(type == 1){
            var request = URLRequest(url: URL(string: "http://192.168.8.105:62812/api/getCourseData/" + localStorage.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: ""))!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", "singiattend-admin","singiattend-server2021").data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student course data: \(error)")
                    DispatchQueue.main.async {
                        self.serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.async { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        let coursesData_json = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
                        
                        self.courses.removeAll()
                        
                        for course in coursesData_json!{
                            var newCourseData = [String]()
                            
                            if(Locale.current.languageCode == "sr"){
                                newCourseData.append((course["subject"] as! String))
                            }
                            else{ newCourseData.append((course["subjectEnglish"] as! String)) }
                            
                            newCourseData.append((course["nameSurname"] as! String))
                            newCourseData.append((course["beginTime"] as! String))
                            newCourseData.append((course["endTime"] as! String))
                            newCourseData.append(String(course["subjectId"] as! String))
                            
                            self.courses.append(newCourseData)
                        }
                        
                        self.courses_tv.reloadData()
                    }
                }
            }.resume()
        }
        else if(type == 2){
            var request = URLRequest(url: URL(string: "http://192.168.8.105:62812/api/getAttendanceData/" + localStorage.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: ""))!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", "singiattend-admin","singiattend-server2021").data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student attendance data: \(error)")
                    DispatchQueue.main.async {
                        self.serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.async { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        let attendanceData_json = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
                        
                        self.attendances.removeAll()
                        
                        for course in attendanceData_json!{
                            var newAttendanceData = [String]()
                            
                            if(Locale.current.languageCode == "sr"){
                                newAttendanceData.append((course["attendanceSubobjectInstance"] as! [String:Any])["title"] as! String)
                            }
                            else{
                                newAttendanceData.append((course["attendanceSubobjectInstance"] as! [String:Any])["titleEnglish"] as! String)
                            }
                            newAttendanceData.append((course["attendanceSubobjectInstance"] as! [String:Any])["nameT"] as! String)
                            newAttendanceData.append((course["attendanceSubobjectInstance"] as! [String:Any])["nameA"] as? String ?? "")
                            newAttendanceData.append(String((course["attendedLectures"] as! Int)))
                            newAttendanceData.append(String((course["totalLectures"] as! Int)))
                            newAttendanceData.append(String((course["attendedPractices"] as! Int)))
                            newAttendanceData.append(String((course["totalPractices"] as! Int)))
                            newAttendanceData.append(String((course["attendanceSubobjectInstance"] as! [String:Any])["isInactive"] as! String))
                            
                            self.attendances.append(newAttendanceData)
                        }
                        
                        self.updatePieChart()
                    }
                }
            }.resume()
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
        
        cell.class_text.text = courses[indexPath.row][0].split(separator: "-")[0]
            + "\n" + courses[indexPath.row][1]
            + "\n(" + courses[indexPath.row][2] + " - "
            + courses[indexPath.row][3] + ")"
        cell.url = String(courses[indexPath.row][4]) + "/" + String(courses[indexPath.row][0].contains("вежбе") || courses[indexPath.row][0].contains("practice"))
        cell.cconfirm_btn.isHidden = false
        return cell
    }
    
    @objc func reloadTable(){
        self.startDataStreaming(1)
        self.startDataStreaming(2)
    }
    
    func updatePieChart(){
        if(self.attendances_pcv.isHidden && !attendances.isEmpty){
            self.attendances_pcv.isHidden = false
            self.attendanceLeft_btn.isHidden = false
            self.attendanceRight_btn.isHidden = false
            self.attendances_class_text.isHidden = false
            self.attendances_prognosis_text.isHidden = false
        }
        
        if(currentAttendanceLecture == attendances.count - 1){
            self.attendanceRight_btn.alpha = 0
            self.attendanceRight_btn.isUserInteractionEnabled = false
        }
        
        var percentage = 0.0;
        
        if(Double(attendances[currentAttendanceLecture][3] + attendances[currentAttendanceLecture][5])! != 0 && Double(attendances[currentAttendanceLecture][4]+attendances[currentAttendanceLecture][6])! != 0){
            percentage = Double(attendances[currentAttendanceLecture][3] + attendances[currentAttendanceLecture][5])! / Double(attendances[currentAttendanceLecture][4]+attendances[currentAttendanceLecture][6])! * 100.0
        }
        attendances_pcv.centerText = String(round(percentage)) + "% \n" + attendances[currentAttendanceLecture][3] + "/" + attendances[currentAttendanceLecture][4] + "\n" + attendances[currentAttendanceLecture][5] + "/" + attendances[currentAttendanceLecture][6]

        attendances_pcv.legend.enabled = false
        attendances_pcv.isUserInteractionEnabled = false
        attendendL.value = Double(attendances[currentAttendanceLecture][3])!
        attendendL.label = nil
        
        notAttendedL.value = Double(attendances[currentAttendanceLecture][4])! - Double(attendances[currentAttendanceLecture][3])!
        notAttendedL.label = nil
        
        attendendP.value = Double(attendances[currentAttendanceLecture][5])!
        attendendP.label = nil
        
        notAttendedP.value = Double(attendances[currentAttendanceLecture][6])! - Double(attendances[currentAttendanceLecture][5])!
        notAttendedP.label = nil
        
        let chartDataSet = PieChartDataSet(entries: [attendendL,notAttendedL,attendendP,notAttendedP], label: nil)
        chartDataSet.colors = [UIColor.green,UIColor.red,UIColor.cyan,UIColor.magenta]
        chartDataSet.drawValuesEnabled = false
        attendances_pcv.data = PieChartData(dataSet: chartDataSet)
        
        attendances_class_text.text = attendances[currentAttendanceLecture][0]
            + "\n" + attendances[currentAttendanceLecture][1]
            + ( attendances[currentAttendanceLecture][2].isEmpty ? "" : ("\n(" + attendances[currentAttendanceLecture][2] + ")") )
        if(Locale.current.languageCode == "sr"){
            if(Double(attendances[currentAttendanceLecture][3] + attendances[currentAttendanceLecture][5])! != 0 && Double(attendances[currentAttendanceLecture][4]+attendances[currentAttendanceLecture][6])! != 0){
                attendances_prognosis_text.text = "Прогноза бодова за присуство: " + String(Int(10.0*Double(attendances[currentAttendanceLecture][3]+attendances[currentAttendanceLecture][5])!/Double(attendances[currentAttendanceLecture][4]+attendances[currentAttendanceLecture][6])!)) + "/10"
            } else { attendances_prognosis_text.text = "Прогноза бодова за присуство: 0/10" }
            if(attendances[currentAttendanceLecture][7] == "1"){
                attendances_prognosis_text.text = attendances_prognosis_text.text! + "\n (КРАЈ НАСТАВЕ)"
            }
        }
        else {
            if(Double(attendances[currentAttendanceLecture][3] + attendances[currentAttendanceLecture][5])! != 0 && Double(attendances[currentAttendanceLecture][4]+attendances[currentAttendanceLecture][6])! != 0){
                attendances_prognosis_text.text = "Forecast points for attendance: " + String(Int(10.0*Double(attendances[currentAttendanceLecture][3]+attendances[currentAttendanceLecture][5])!/Double(attendances[currentAttendanceLecture][4]+attendances[currentAttendanceLecture][6])!)) + "/10"
            } else { attendances_prognosis_text.text = "Forecast points for attendance: 0/10" }
            if(attendances[currentAttendanceLecture][7] == "1"){
                attendances_prognosis_text.text = attendances_prognosis_text.text! + "\n (LECTURES ARE OVER)"
            }
        }
    }
    
    func login(_ index: String, _ data:Data, completionHandler: @escaping (String?) -> Void) {
        var request = URLRequest(url: URL(string: "http://192.168.8.105:62812/api/checkPassword/student/" + index)!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("text/plain", forHTTPHeaderField: "Accept")
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic \(String(format: "%@:%@", "singiattend-admin","singiattend-server2021").data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place while sending login data: \(error)")
                completionHandler("400")
            }
            
            if let response = response {
                if ((response as! HTTPURLResponse).statusCode != 200){ completionHandler("500")
                }
            }
            
            if let data = data {
                completionHandler(String(data: data, encoding: .utf8))
            }
        }.resume()
    }
}
