//
//  ViewController.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 14.8.20..
//  Copyright © 2020. Марко Дојкић. All rights reserved.
//

import UIKit
import Charts
import LocalAuthentication

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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChartViewDelegate {
    
    @IBOutlet weak var titleMain_text: UILabel!
    @IBOutlet weak var copyright_text: UILabel!
    @IBOutlet weak var loggedInAs_text: UILabel!
    @IBOutlet weak var logout_btn: UIButton!
    @IBOutlet weak var loginPopup: UIView!
    @IBOutlet weak var indexLogin_text: UILabel!
    @IBOutlet weak var indexLogin_txt: UITextField!
    @IBOutlet weak var passLogin_text: UILabel!
    @IBOutlet weak var passLogin_txt: UITextField!
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var login_biometrics_btn: UIButton!
    @IBOutlet weak var overlay: UIImageView!
    @IBOutlet weak var courses_tv: UITableView!
    @IBOutlet weak var attendances_pcv: PieChartView!
    @IBOutlet weak var attendances_class_text: UILabel!
    @IBOutlet weak var attendances_prognosis_text: UILabel!
    @IBOutlet weak var attendanceLeft_btn: UIButton!
    @IBOutlet weak var attendanceRight_btn: UIButton!
    @IBOutlet weak var serverInacitve_text: UILabel!
    @IBOutlet weak var saveForBiometrics_text: UILabel!
    @IBOutlet weak var saveForBiometrics_switch: UISwitch!
    
    struct AttendanceRecord {
        let title: String
        let nameTeacher: String
        let nameAssistant: String
        let attendedLectures: Double
        let totalLectures: Double
        let attendedPractices: Double
        let totalPractices: Double
        let isInactive: Bool
        
        init(title: String, nameTeacher: String, nameAssistant: String, attendedLectures: Double, totalLectures: Double, attendedPractices: Double, totalPractices: Double, isInactive: Bool) {
            self.title = title
            self.nameTeacher = nameTeacher
            self.nameAssistant = nameAssistant
            self.attendedLectures = attendedLectures
            self.totalLectures = totalLectures
            self.attendedPractices = attendedPractices
            self.totalPractices = totalPractices
            self.isInactive = isInactive
        }
    }
    
    let context = LAContext()
    let localStorage = UserDefaults.standard
    var courses = [[String]]()
    var attendances = [AttendanceRecord]()
    let attendendL = PieChartDataEntry(value: 0)
    let notAttendedL = PieChartDataEntry(value: 0)
    let attendendP = PieChartDataEntry(value: 0)
    let notAttendedP = PieChartDataEntry(value: 0)
    var currentlySelectedAttendanceIndex = 0
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
        login_biometrics_btn.setTitle("loginUsingBiometricsAuthentication".localized(), for: UIControl.State.normal)
        saveForBiometrics_text.text = "saveForBiometricsAuthentication".localized()
        
        login_btn.layer.cornerRadius = 10
        register_btn.layer.cornerRadius = 10
        logout_btn.layer.cornerRadius = 10
        self.view.addSubview(loginPopup);
        loginPopup.center = self.view.center
        loginPopup.layer.cornerRadius = 18
        
        courses_tv.dataSource = self
        courses_tv.rowHeight = 80
        
        attendances_pcv.delegate = self
        attendances_pcv.legend.enabled = true
        attendances_pcv.legend.orientation = .horizontal
        attendances_pcv.legend.font = UIFont.italicSystemFont(ofSize: 10)
        attendances_pcv.legend.form = .circle
        attendances_pcv.isUserInteractionEnabled = true
        attendances_pcv.holeColor = NSUIColor.black
        attendances_pcv.drawEntryLabelsEnabled = false
        attendances_pcv.holeRadiusPercent = 0.75
        
        attendendL.label = "attendendL".localized()
        notAttendedL.label = "notAttendedL".localized()
        attendendP.label = "attendendP".localized()
        notAttendedP.label = "notAttendedP".localized()
        
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
            attendances_pcv.isHidden = true
            attendanceLeft_btn.isHidden = true
            attendanceRight_btn.isHidden = true
            startDataStreaming(0)
            updateTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(reloadTable), userInfo: nil, repeats: true)
        }
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    
    @IBAction func checkIndex(_ sender: Any) {
        if(indexLogin_txt.text!.count == 5 && indexLogin_txt.text?.last != "/"){
            indexLogin_txt.text!.insert("/", at: indexLogin_txt.text!.index(before: indexLogin_txt.text!.endIndex))
        }
    }
    
    @IBAction func attendance_goLeft(_ sender: UIButton!) {
        currentlySelectedAttendanceIndex = currentlySelectedAttendanceIndex - 1
        
        if(currentlySelectedAttendanceIndex < attendances.count - 1){
            attendanceRight_btn.alpha = 1
            attendanceRight_btn.isUserInteractionEnabled = true
        }
        
        if(currentlySelectedAttendanceIndex == 0){
            sender.alpha = 0
            sender.isUserInteractionEnabled = false
        }
        
        updatePieChart()
    }
    
    @IBAction func attendance_goRight(_ sender: UIButton!) {
        currentlySelectedAttendanceIndex = currentlySelectedAttendanceIndex + 1
        
        if(currentlySelectedAttendanceIndex > 0){
            attendanceLeft_btn.alpha = 1
            attendanceLeft_btn.isUserInteractionEnabled = true
        }
        
        if(currentlySelectedAttendanceIndex == attendances.count - 1){
            sender.alpha = 0
            sender.isUserInteractionEnabled = false
        }
        
        updatePieChart()
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        self.localStorage.set(indexLogin_txt.text, forKey: "loggedInAs")
        
        login((indexLogin_txt.text?.replacingOccurrences(of: "/", with: ""))!, (passLogin_txt.text?.data(using: .utf8))!, completionHandler: loginCompletionHandler)
    }
    
    @IBAction func onLoginWithBiometrics(_ sender: UIButton) {
                
        guard let biometricsIndexNumber = self.localStorage.string(forKey: "biometricsIndexNumber") else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "biometricsNoAccountMessage".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
            }
            
            return
        }
            
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "biometricsNotAvailable".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
            }
            
            return
        }
            
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: String(format: "biometricsLoginReason".localized(), biometricsIndexNumber)) { (isSuccessful, errorType) in
            
            if isSuccessful {
                let keychainItem: KeychainPasswordItem = KeychainPasswordItem(account: biometricsIndexNumber)
                
                guard let password = try? keychainItem.readPassword() else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "biometricsKeychainReadFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                    
                    return
                }
                
                self.localStorage.set(keychainItem.account, forKey: "loggedInAs")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.login(keychainItem.account.replacingOccurrences(of: "/", with: ""), (password.data(using: .utf8))!, completionHandler: self.loginCompletionHandler)
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    var message: String
                    
                    switch errorType {
                        case LAError.authenticationFailed?:
                            message = "biometricsAuthenticationFailed".localized()
                        case LAError.biometryNotAvailable?:
                            message = "biometricsNotAvailable".localized()
                        case LAError.biometryNotEnrolled?:
                            message = "biometricsNotEnrolled".localized()
                        case LAError.biometryLockout?:
                            message = "biometricsLockout".localized()
                        default:
                            message = "biometricsGenericError".localized()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: message, style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
            }
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
        ///updateTimer.invalidate(
    }
    
    @objc func startDataStreaming(_ type: Int){
        if(type == 0){
            var request = URLRequest(url: URL(string: Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/getStudentName/" + localStorage.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: ""))!)
            request.httpMethod = "GET"
            request.setValue("text/plain", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", Bundle.main.infoDictionary!["ServerUsername"]! as! String, Bundle.main.infoDictionary!["ServerPassword"]! as! String).data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
                        
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student name data: \(error)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.loggedInAs_text.text = "(" + self.localStorage.string(forKey: "loggedInAs")! + ")";
                        self.serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.loggedInAs_text.text = "-SERVER ERROR- (" + self.localStorage.string(forKey: "loggedInAs")! + ")"
                            self.loggedInAs_text.adjustsFontSizeToFitWidth = true;
                        }
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.loggedInAs_text.text = String(data: data, encoding: .utf8)! + " (" + self.localStorage.string(forKey: "loggedInAs")! + ")"
                        self.loggedInAs_text.adjustsFontSizeToFitWidth = true;
                        self.startDataStreaming(1);
                        self.startDataStreaming(2);
                    }
                }
            }.resume()
        }
        else if(type == 1){
            var request = URLRequest(url: URL(string: Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/getCourseData/" + localStorage.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: ""))!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", Bundle.main.infoDictionary!["ServerUsername"]! as! String, Bundle.main.infoDictionary!["ServerPassword"]! as! String).data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student course data: \(error)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        let coursesData_json = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
                        
                        self.courses.removeAll()
                        
                        for course in coursesData_json!{
                            var newCourseData = [String]()
                            
                            if(Locale.current.language.languageCode!.identifier == "sr"){
                                newCourseData.append((course["subject"] as! String))
                            }
                            else{ newCourseData.append((course["subjectEnglish"] as! String)) }
                            
                            let dateFormatter = DateFormatter()
                            
                            dateFormatter.locale = Locale(identifier: "en")
                            
                            dateFormatter.dateFormat = "E MM dd HH:mm:ss 'CEST' yyyy"
                            
                            let beginDate = dateFormatter.date(from: (course["beginTime"] as! String))
                            let endDate = dateFormatter.date(from: (course["endTime"] as! String))
                            
                            dateFormatter.locale = NSLocale.current
                            
                            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
                            
                            newCourseData.append((course["nameSurname"] as! String))
                            newCourseData.append(dateFormatter.string(from: beginDate!))
                            newCourseData.append(dateFormatter.string(from: endDate!))
                            newCourseData.append(String(course["subjectId"] as! String))
                            
                            self.courses.append(newCourseData)
                        }
                        
                        self.courses_tv.reloadData()
                    }
                }
            }.resume()
        }
        else if(type == 2){
            var request = URLRequest(url: URL(string: Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/getAttendanceData/" + localStorage.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: ""))!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", Bundle.main.infoDictionary!["ServerUsername"]! as! String, Bundle.main.infoDictionary!["ServerPassword"]! as! String).data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student attendance data: \(error)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        let attendanceData_json = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
                        
                        self.attendances.removeAll()
                        
                        for course in attendanceData_json!{
                            self.attendances.append(AttendanceRecord.init(title: Locale.current.language.languageCode!.identifier == "sr" ? (course["attendanceSubobjectInstance"] as! [String:Any])["title"] as! String : (course["attendanceSubobjectInstance"] as! [String:Any])["titleEnglish"] as! String, nameTeacher: (course["attendanceSubobjectInstance"] as! [String:Any])["nameT"] as! String, nameAssistant: (course["attendanceSubobjectInstance"] as! [String:Any])["nameA"] as? String ?? "", attendedLectures: (course["attendedLectures"] as! Double), totalLectures: (course["totalLectures"] as! Double), attendedPractices: (course["attendedPractices"] as! Double), totalPractices: (course["totalPractices"] as! Double), isInactive: ((course["attendanceSubobjectInstance"] as! [String:Any])["isInactive"] as! String) == "1").self)
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
        
        cell.class_text.text = courses[indexPath.row][0].split(separator: "-")[0] + ""
        cell.class_text.text! += "\n" + courses[indexPath.row][1]
        cell.class_text.text! += "\n(" + courses[indexPath.row][2] + " - "
        cell.class_text.text! += courses[indexPath.row][3] + ")"
        cell.url = String(courses[indexPath.row][4]) + "/" + String(courses[indexPath.row][0].contains("вежбе") || courses[indexPath.row][0].contains("practice"))
        cell.cconfirm_btn.isHidden = false
        return cell
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let dataSet = chartView.data?.dataSets[highlight.dataSetIndex] else { return }
        
        var percentage: Double
        var details: String
        var color: UIColor
                
        switch (dataSet.entryIndex(entry: entry) + 3){
            case 3:
                percentage = Double(attendances[currentlySelectedAttendanceIndex].attendedLectures / attendances[currentlySelectedAttendanceIndex].totalLectures) * 100.0
                details = String(format: "(%.0f/%.0f)", arguments: [attendances[currentlySelectedAttendanceIndex].attendedLectures, attendances[currentlySelectedAttendanceIndex].totalLectures])
                color = UIColor.green
            case 4:
                percentage = Double((attendances[currentlySelectedAttendanceIndex].totalLectures - attendances[currentlySelectedAttendanceIndex].attendedLectures) / attendances[currentlySelectedAttendanceIndex].totalLectures) * 100.0
                details = String(format: "(%.0f/%.0f)", arguments: [attendances[currentlySelectedAttendanceIndex].totalLectures - attendances[currentlySelectedAttendanceIndex].attendedLectures, attendances[currentlySelectedAttendanceIndex].totalLectures])
                color = UIColor.red
            case 5:
                percentage = attendances[currentlySelectedAttendanceIndex].attendedPractices / attendances[currentlySelectedAttendanceIndex].totalPractices * 100.0
                details = String(format: "(%.0f/%.0f)", arguments: [attendances[currentlySelectedAttendanceIndex].attendedPractices, attendances[currentlySelectedAttendanceIndex].totalPractices])
                color = UIColor.cyan
            case 6:
                percentage = Double((attendances[currentlySelectedAttendanceIndex].totalPractices - attendances[currentlySelectedAttendanceIndex].attendedPractices) / attendances[currentlySelectedAttendanceIndex].totalPractices) * 100.0
                details = String(format: "(%.0f/%.0f)", arguments: [attendances[currentlySelectedAttendanceIndex].totalPractices - attendances[currentlySelectedAttendanceIndex].attendedPractices, attendances[currentlySelectedAttendanceIndex].totalPractices])
                color = UIColor.magenta
            default:
                percentage = -1.0
                details = ""
            color = UIColor.clear
        }
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        
        attendances_pcv.centerAttributedText = NSAttributedString(string: String(format: "%.0f%%\n%@", arguments: [percentage, details]), attributes: [ .font: UIFont.boldSystemFont(ofSize: 12), .foregroundColor: color, .backgroundColor: UIColor.black, .paragraphStyle: paragraphStyle])
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        attendances_pcv.centerAttributedText = nil
    }
    
    @objc func reloadTable(){
        self.startDataStreaming(1)
        self.startDataStreaming(2)
    }
    
    func updatePieChart(){
        if(attendances.isEmpty){
            self.attendances_pcv.isHidden = true
            self.attendanceLeft_btn.isHidden = true
            self.attendanceRight_btn.isHidden = true
            self.attendances_class_text.isHidden = true
            self.attendances_prognosis_text.isHidden = true
            return
        } else if(self.attendances_pcv.isHidden) {
            self.attendances_pcv.isHidden = false
            self.attendanceLeft_btn.isHidden = false
            self.attendanceRight_btn.isHidden = false
            self.attendances_class_text.isHidden = false
            self.attendances_prognosis_text.isHidden = false
            attendanceLeft_btn.alpha = 0
            attendanceLeft_btn.isUserInteractionEnabled = false
            attendanceRight_btn.alpha = attendances.count == 1 ? 0 : 1
            attendanceRight_btn.isUserInteractionEnabled = attendances.count != 1
        }
        
        self.attendances_pcv.highlightValue(nil)
        self.attendances_pcv.centerAttributedText = nil
        
        attendendL.value = attendances[currentlySelectedAttendanceIndex].attendedLectures
                
        notAttendedL.value = attendances[currentlySelectedAttendanceIndex].totalLectures - attendances[currentlySelectedAttendanceIndex].attendedLectures
                
        attendendP.value = attendances[currentlySelectedAttendanceIndex].attendedPractices
                
        notAttendedP.value = attendances[currentlySelectedAttendanceIndex].totalPractices - attendances[currentlySelectedAttendanceIndex].attendedPractices
        
        
        let chartDataSet = PieChartDataSet(entries: [attendendL,notAttendedL,attendendP,notAttendedP], label: "")
        chartDataSet.colors = [UIColor.green,UIColor.red,UIColor.cyan,UIColor.magenta]
        chartDataSet.drawValuesEnabled = false
        chartDataSet.selectionShift = 4.0
        attendances_pcv.data = PieChartData(dataSet: chartDataSet)
        
        let attendanceText = NSMutableAttributedString(string: attendances[currentlySelectedAttendanceIndex].title.capitalized
                + "\n" + attendances[currentlySelectedAttendanceIndex].nameTeacher + ( attendances[currentlySelectedAttendanceIndex].nameAssistant.isEmpty ? "" : ("\n("
                + attendances[currentlySelectedAttendanceIndex].nameAssistant + ")") ), attributes: nil)
                
        attendanceText.setAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15.0)], range: (attendanceText.string as NSString).range(of: attendances[currentlySelectedAttendanceIndex].title.capitalized))
        
        attendances_class_text.attributedText = attendanceText
        
        let forecastAttendancePoints: String = String(format: "%.0f", arguments: [((attendances[currentlySelectedAttendanceIndex].totalLectures + attendances[currentlySelectedAttendanceIndex].totalPractices) == 0.0 || (attendances[currentlySelectedAttendanceIndex].attendedLectures + attendances[currentlySelectedAttendanceIndex].attendedPractices) == 0.0) ? 0.0 : round(Double((attendances[currentlySelectedAttendanceIndex].attendedLectures + attendances[currentlySelectedAttendanceIndex].attendedPractices) / (attendances[currentlySelectedAttendanceIndex].totalLectures + attendances[currentlySelectedAttendanceIndex].totalPractices)) * 10.0)])
        
        attendances_prognosis_text.text = String(format: "forecastAttendancePoints".localized(), arguments: [forecastAttendancePoints]) + (!attendances[currentlySelectedAttendanceIndex].isInactive ? "\n (" + "classOver".localized() + ")" : "")
        attendances_prognosis_text.font = UIFont.systemFont(ofSize: 7)
    }
    
    func login(_ index: String, _ data:Data, completionHandler: @escaping (String?) -> Void) {
        var request = URLRequest(url: URL(string: Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/checkPassword/student/" + index)!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("text/plain", forHTTPHeaderField: "Accept")
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic \(String(format: "%@:%@", Bundle.main.infoDictionary!["ServerUsername"]! as! String, Bundle.main.infoDictionary!["ServerPassword"]! as! String).data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
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
    
    private func loginCompletionHandler(response: String?) -> Void {
        if let message = response {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { //To fix Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread
                if(message == "VALID"){
                    SweetAlert().showAlert("loginTitleSuccess".localized(), subTitle: "", style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray, otherButtonTitle: "rememberCredentials".localized(), otherButtonColor: UIColor.green) { (isMainButton) -> Void in
                        self.localStorage.set(true, forKey:"isLoggedIn")
                        self.startDataStreaming(0)
                        self.overlay.isHidden = true
                        self.loginPopup.isHidden = true
                        self.loggedInAs_text.isHidden = false
                        self.logout_btn.isHidden = false
                        self.courses_tv.isHidden = false
                    
                        if(self.saveForBiometrics_switch.isOn){
                            self.localStorage.set(self.indexLogin_txt.text!, forKey: "biometricsIndexNumber")
                        }
                                            
                        if(!isMainButton){
                            do {
                                try KeychainPasswordItem(account: self.indexLogin_txt.text!).savePassword(self.passLogin_txt.text!)
                            } catch {
                                print("Error occurred while saving credentials: \(error)")
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    SweetAlert().showAlert("titleCredentialsNotSaved".localized(), subTitle: "messageCredentialsNotSaved".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                SweetAlert().showAlert("titleCredentialsSaved".localized(), subTitle: "messageCredentialsSaved".localized(), style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                            }
                        }
                    }
                }
                else if(message == "INVALID"){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
                else if(message == "UNKNOWN"){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageUnknown".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
            }
        }
    }
}
