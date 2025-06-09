//
//  ViewController.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 14.8.20..
//  Copyright © 2020. Марко Дојкић. All rights reserved.
//

import UIKit
import DGCharts
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
    @IBOutlet weak var facultyPlace_text: UILabel!
    @IBOutlet weak var facultyPlace_sc:UISegmentedControl!
    
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
    var courses = [[String]]()
    var attendances = [AttendanceRecord]()
    let attendendL = PieChartDataEntry(value: 0)
    let notAttendedL = PieChartDataEntry(value: 0)
    let attendendP = PieChartDataEntry(value: 0)
    let notAttendedP = PieChartDataEntry(value: 0)
    var currentlySelectedAttendanceIndex = 0
    var updateTimer: Timer!
    let APPLICATION_JSON_CHARSET_UTF_8 = "application/json;charset=UTF-8"
    let PIE_CHART_GRAPH_FORMAT = "(%.0f/%.0f)"
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        titleMain_text.text = "title_main".localized()
        copyright_text.text = "copyright".localized()
        logout_btn.setTitle("logout".localized(), for: UIControl.State.normal)
        logout_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        indexLogin_text.text = "br_indexa".localized()
        indexLogin_txt.placeholder = "hint_index_login".localized()
        passLogin_text.text = "password".localized()
        passLogin_txt.placeholder = "hint_pass".localized()
        register_btn.setTitle("register".localized(), for: UIControl.State.normal)
        register_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        login_btn.setTitle("login".localized(), for: UIControl.State.normal)
        login_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        login_biometrics_btn.setTitle("loginUsingBiometricsAuthentication".localized(), for: UIControl.State.normal)
        login_biometrics_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        saveForBiometrics_text.text = "saveForBiometricsAuthentication".localized()
        facultyPlace_text.text = "facultyPlace".localized()
        facultyPlace_sc.setTitle("bg".localized(), forSegmentAt: 0)
        facultyPlace_sc.setTitle("ns".localized(), forSegmentAt: 1)
        facultyPlace_sc.setTitle("nis".localized(), forSegmentAt: 2)
        facultyPlace_sc.selectedSegmentIndex = UISegmentedControl.noSegment
        
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
        
        if(SecureStorage.load(key: "loggedInStudentProxyIdentifier") == nil){
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
            facultyPlace_sc.selectedSegmentIndex = UISegmentedControl.noSegment
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
            updateTimer = Timer.scheduledTimer(timeInterval: 10.00, target: self, selector: #selector(reloadTable), userInfo: nil, repeats: true) //Reload attendances subject every 10 minutes
            if(CsrfTokenManager.shared.proxyIdentifier.isEmpty){
                CsrfTokenManager.shared.proxyIdentifier = String(decoding: SecureStorage.load(key: "loggedInStudentProxyIdentifier")!, as: UTF8.self)
                CsrfTokenManager.shared.fetchCsrfSession { success in
                    if success {
                        self.startDataStreaming(0)
                    } else {
                        print("Failed to fetch CSRF session")
                    }
                }
            } else { startDataStreaming(0) }
        }
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    
    @IBAction func checkIndex(_ sender: UITextField) {
        if(sender.text!.count == 5 && sender.text?.last != "/"){
            sender.text!.insert("/", at: sender.text!.index(before: sender.text!.endIndex))
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
    
    @IBAction func updateProxyIdentifier(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: CsrfTokenManager.shared.proxyIdentifier = "SingidunumBG"
            case 1: CsrfTokenManager.shared.proxyIdentifier = "SingidunumNS"
            case 2: CsrfTokenManager.shared.proxyIdentifier = "SingidunumNIS"
            default: CsrfTokenManager.shared.proxyIdentifier = ""
        }
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        login((indexLogin_txt.text?.replacingOccurrences(of: "/", with: ""))!, (passLogin_txt.text?.data(using: .utf8))!, completionHandler: loginCompletionHandler)
    }
    
    @IBAction func onLoginWithBiometrics(_ sender: UIButton) {
                
        guard let biometricsIndexNumber = SecureStorage.load(key: "biometricsIndexNumber") else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "biometricsNoAccountMessage".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
            }
            
            return
        }
            
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "biometricsNotAvailable".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
            }

            return
        }
            
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: String(format: "biometricsLoginReason".localized(), String(decoding: biometricsIndexNumber, as: UTF8.self).self)) { (isSuccessful, errorType) in
            
            if isSuccessful {
                guard
                    let password = SecureStorage.load(key: "biometricsStudentPassword"),
                    let proxyIdentifier = SecureStorage.load(key: "biometricsStudentProxyIdentifier") else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "biometricsKeychainReadFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                    
                    return
                }
                
                CsrfTokenManager.shared.proxyIdentifier = String(decoding: proxyIdentifier, as: UTF8.self)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                    login(String(decoding: biometricsIndexNumber, as: UTF8.self).replacingOccurrences(of: "/", with: ""), password, completionHandler: loginCompletionHandler)
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
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: message, style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
            }
        }
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegister", sender: sender)
    }
    
    @IBAction func onLogout(_ sender: UIButton) {
        SecureStorage.delete(key: "loggedInStudentIndex")
        SecureStorage.delete(key: "loggedInStudentProxyIdentifier")
        CsrfTokenManager.shared.logoutFromCsrfSession()
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
        guard let serverUrl = Bundle.main.infoDictionary?["ServerURL"] as? String,
              let username = Bundle.main.infoDictionary?["ServerUsername"] as? String,
              let password = Bundle.main.infoDictionary?["ServerPassword"] as? String else {
            print("Missing server info from Info.plist")
            return
        }
        
        let loggedInStudentIndex = String(decoding: SecureStorage.load(key: "loggedInStudentIndex")!, as: UTF8.self)
        
        if(type == 0){
            var request = URLRequest(url: URL(string: "\(serverUrl)/api/getStudentName/\(loggedInStudentIndex.replacingOccurrences(of: "/", with: ""))")!)
            request.httpMethod = "GET"
            request.setValue(CsrfTokenManager.shared.proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
            request.setValue("text/plain;charset=UTF-8", forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", username, password).data(using: .utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            request.setValue(CsrfTokenManager.shared.sessionData.csrfTokenSecret, forHTTPHeaderField: CsrfTokenManager.shared.sessionData.csrfHeaderName)
            let cookieValue = "JSESSIONID=\(CsrfTokenManager.shared.sessionData.jsessionId); XSRF-TOKEN=\(CsrfTokenManager.shared.sessionData.xsrfToken)"
            request.setValue(cookieValue, forHTTPHeaderField: "Cookie")

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error took place while getting student name data: \(error)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                        loggedInAs_text.text = "(\(loggedInStudentIndex))";
                        serverInacitve_text.text = "serverInactive".localized();
                    }
                    return;
                }
                
                if let response = response {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { self.serverInacitve_text.text = ""; }
                    if ((response as! HTTPURLResponse).statusCode != 200){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                            loggedInAs_text.text = "-SERVER ERROR- (\(loggedInStudentIndex))"
                            loggedInAs_text.adjustsFontSizeToFitWidth = true;
                        }
                        return;
                    }
                }
                
                if let data = data {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                        loggedInAs_text.text = String(data: data, encoding: .utf8)! + " (\(loggedInStudentIndex))"
                        loggedInAs_text.adjustsFontSizeToFitWidth = true;
                        startDataStreaming(1);
                        startDataStreaming(2);
                    }
                }
            }.resume()
        }
        else if(type == 1){
            var request = URLRequest(url: URL(string: "\(serverUrl)/api/getCourseData/\(loggedInStudentIndex.replacingOccurrences(of: "/", with: ""))")!)
            request.httpMethod = "GET"
            request.setValue(CsrfTokenManager.shared.proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
            request.setValue(APPLICATION_JSON_CHARSET_UTF_8, forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", username, password).data(using: .utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            request.setValue(CsrfTokenManager.shared.sessionData.csrfTokenSecret, forHTTPHeaderField: CsrfTokenManager.shared.sessionData.csrfHeaderName)
            let cookieValue = "JSESSIONID=\(CsrfTokenManager.shared.sessionData.jsessionId); XSRF-TOKEN=\(CsrfTokenManager.shared.sessionData.xsrfToken)"
            request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
            
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
                        guard let coursesData_json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] else { return }
                        
                        self.courses.removeAll()
                        
                        for course in coursesData_json{
                            var newCourseData = [String]()
                            
                            if(Locale.current.language.languageCode!.identifier == "sr"){
                                newCourseData.append(course["subject"] as! String)
                            }
                            else{ newCourseData.append(course["subjectEnglish"] as! String) }
                            
                            let formatter = DateFormatter()
                            formatter.locale = Locale(identifier: "en_US_POSIX")  // Important for fixed format
                            formatter.dateFormat = "EEE MMM dd HH:mm:ss 'GMT' yyyy"
                            formatter.timeZone = TimeZone(abbreviation: "GMT")
                            let localDateFormatter = DateFormatter()
                            localDateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
                            localDateFormatter.timeZone = .current
                            
                            newCourseData.append(course["nameSurname"] as! String)
                            newCourseData.append(localDateFormatter.string(from: formatter.date(from: (course["beginTime"] as! String))!))
                            newCourseData.append(localDateFormatter.string(from: formatter.date(from: (course["endTime"] as! String))!))
                            newCourseData.append(course["id"] as! String)
                            
                            self.courses.append(newCourseData)
                        }
                        
                        self.courses_tv.reloadData()
                    }
                }
            }.resume()
        }
        else if(type == 2){
            var request = URLRequest(url: URL(string: "\(serverUrl)/api/getAttendanceData/\(loggedInStudentIndex.replacingOccurrences(of: "/", with: ""))")!)
            request.httpMethod = "GET"
            request.setValue(CsrfTokenManager.shared.proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
            request.setValue(APPLICATION_JSON_CHARSET_UTF_8, forHTTPHeaderField: "Accept")
            request.setValue("Basic \(String(format: "%@:%@", username, password).data(using: .utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
            
            request.setValue(CsrfTokenManager.shared.sessionData.csrfTokenSecret, forHTTPHeaderField: CsrfTokenManager.shared.sessionData.csrfHeaderName)
            let cookieValue = "JSESSIONID=\(CsrfTokenManager.shared.sessionData.jsessionId); XSRF-TOKEN=\(CsrfTokenManager.shared.sessionData.xsrfToken)"
            request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
            
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
                        guard let attendanceData_json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] else { return }
                        
                        self.attendances.removeAll()
                        
                        for course in attendanceData_json {
                            self.attendances.append(AttendanceRecord.init(title: Locale.current.language.languageCode!.identifier == "sr" ? (course["attendanceHelperInstance"] as! [String:Any])["title"] as! String : (course["attendanceHelperInstance"] as! [String:Any])["titleEnglish"] as! String, nameTeacher: (course["attendanceHelperInstance"] as! [String:Any])["nameT"] as! String, nameAssistant: (course["attendanceHelperInstance"] as! [String:Any])["nameA"] as? String ?? "", attendedLectures: (course["attendedLectures"] as! Double), totalLectures: (course["totalLectures"] as! Double), attendedPractices: (course["attendedPractices"] as! Double), totalPractices: (course["totalPractices"] as! Double), isInactive: ((course["attendanceHelperInstance"] as! [String:Any])["isInactive"] as! Bool)).self)
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
        
        cell.class_text.text = "\(courses[indexPath.row][0].split(separator: "-")[0])\n\(courses[indexPath.row][1])\n(\(courses[indexPath.row][2]) - \(courses[indexPath.row][3]))"
        cell.url = "\(courses[indexPath.row][4])/\(courses[indexPath.row][0].contains("вежбе") || courses[indexPath.row][0].contains("practice"))"
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
                details = String(format: PIE_CHART_GRAPH_FORMAT, arguments: [attendances[currentlySelectedAttendanceIndex].attendedLectures, attendances[currentlySelectedAttendanceIndex].totalLectures])
                color = UIColor.green
            case 4:
                percentage = Double((attendances[currentlySelectedAttendanceIndex].totalLectures - attendances[currentlySelectedAttendanceIndex].attendedLectures) / attendances[currentlySelectedAttendanceIndex].totalLectures) * 100.0
                details = String(format: PIE_CHART_GRAPH_FORMAT, arguments: [attendances[currentlySelectedAttendanceIndex].totalLectures - attendances[currentlySelectedAttendanceIndex].attendedLectures, attendances[currentlySelectedAttendanceIndex].totalLectures])
                color = UIColor.red
            case 5:
                percentage = attendances[currentlySelectedAttendanceIndex].attendedPractices / attendances[currentlySelectedAttendanceIndex].totalPractices * 100.0
                details = String(format: PIE_CHART_GRAPH_FORMAT, arguments: [attendances[currentlySelectedAttendanceIndex].attendedPractices, attendances[currentlySelectedAttendanceIndex].totalPractices])
                color = UIColor.cyan
            case 6:
                percentage = Double((attendances[currentlySelectedAttendanceIndex].totalPractices - attendances[currentlySelectedAttendanceIndex].attendedPractices) / attendances[currentlySelectedAttendanceIndex].totalPractices) * 100.0
                details = String(format: PIE_CHART_GRAPH_FORMAT, arguments: [attendances[currentlySelectedAttendanceIndex].totalPractices - attendances[currentlySelectedAttendanceIndex].attendedPractices, attendances[currentlySelectedAttendanceIndex].totalPractices])
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
        
        if(currentlySelectedAttendanceIndex > attendances.count - 1){ currentlySelectedAttendanceIndex = currentlySelectedAttendanceIndex - 1
            updatePieChart()
        }
        
        attendendL.value = attendances[currentlySelectedAttendanceIndex].attendedLectures
                
        notAttendedL.value = attendances[currentlySelectedAttendanceIndex].totalLectures - attendances[currentlySelectedAttendanceIndex].attendedLectures
                
        attendendP.value = attendances[currentlySelectedAttendanceIndex].attendedPractices
                
        notAttendedP.value = attendances[currentlySelectedAttendanceIndex].totalPractices - attendances[currentlySelectedAttendanceIndex].attendedPractices
        
        
        let chartDataSet = PieChartDataSet(entries: [attendendL,notAttendedL,attendendP,notAttendedP], label: "")
        chartDataSet.colors = [UIColor.green,UIColor.red,UIColor.cyan,UIColor.magenta]
        chartDataSet.drawValuesEnabled = false
        chartDataSet.selectionShift = 4.0
        attendances_pcv.data = PieChartData(dataSet: chartDataSet)
        
        let attendanceText = NSMutableAttributedString(string: "\(attendances[currentlySelectedAttendanceIndex].title.capitalized)\n\(attendances[currentlySelectedAttendanceIndex].nameTeacher)\n(\(attendances[currentlySelectedAttendanceIndex].nameAssistant.isEmpty ? "teacherIsAssistant".localized() : attendances[currentlySelectedAttendanceIndex].nameAssistant))")
        
        attendanceText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: attendanceText.mutableString.range(of: attendances[currentlySelectedAttendanceIndex].title.capitalized))
        attendances_class_text.attributedText = attendanceText
        
        let forecastAttendancePoints: String = String(format: "%.0f", arguments: [((attendances[currentlySelectedAttendanceIndex].totalLectures + attendances[currentlySelectedAttendanceIndex].totalPractices) == 0.0 || (attendances[currentlySelectedAttendanceIndex].attendedLectures + attendances[currentlySelectedAttendanceIndex].attendedPractices) == 0.0) ? 0.0 : round(Double((attendances[currentlySelectedAttendanceIndex].attendedLectures + attendances[currentlySelectedAttendanceIndex].attendedPractices) / (attendances[currentlySelectedAttendanceIndex].totalLectures + attendances[currentlySelectedAttendanceIndex].totalPractices)) * 10.0)])
        
        attendances_prognosis_text.text = "\(String(format: "forecastAttendancePoints".localized(), arguments: [forecastAttendancePoints]))\(attendances[currentlySelectedAttendanceIndex].isInactive ? "\n (\("classOver".localized()))" : "")"
        attendances_prognosis_text.font = UIFont.systemFont(ofSize: 7)
    }
    
    func login(_ index: String, _ data:Data, completionHandler: @escaping (String?) -> Void) {
        CsrfTokenManager.shared.fetchCsrfSession { success in
            if success {
                guard let serverUrl = Bundle.main.infoDictionary?["ServerURL"] as? String,
                      let username = Bundle.main.infoDictionary?["ServerUsername"] as? String,
                      let password = Bundle.main.infoDictionary?["ServerPassword"] as? String else {
                    print("Missing server info from Info.plist")
                    completionHandler("400")
                    return
                }
                
                var request = URLRequest(url: URL(string: "\(serverUrl)/api/checkPassword/student/\(index)")!)
                request.httpMethod = "POST"
                request.httpBody = data
                request.setValue(CsrfTokenManager.shared.proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
                request.setValue(self.APPLICATION_JSON_CHARSET_UTF_8, forHTTPHeaderField: "Accept")
                request.setValue(self.APPLICATION_JSON_CHARSET_UTF_8, forHTTPHeaderField: "Content-Type")
                request.setValue("Basic \(String(format: "%@:%@", username, password).data(using: .utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
                
                request.setValue(CsrfTokenManager.shared.sessionData.csrfTokenSecret, forHTTPHeaderField: CsrfTokenManager.shared.sessionData.csrfHeaderName)
                let cookieValue = "JSESSIONID=\(CsrfTokenManager.shared.sessionData.jsessionId); XSRF-TOKEN=\(CsrfTokenManager.shared.sessionData.xsrfToken)"
                request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
                
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
                
            } else {
                print("Failed to fetch CSRF session")
                completionHandler("400")
            }
        }
    }
    
    private func loginCompletionHandler(response: String?) -> Void {
        if let message = response {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { //To fix Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread
                if(message == "VALID"){
                    _ = SweetAlert().showAlert("loginTitleSuccess".localized(), subTitle: "", style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { [self] (isMainButton) -> Void in
                        
                        let index: Data = {
                            if indexLogin_txt.text!.isEmpty {
                                return SecureStorage.load(key: "biometricsIndexNumber")!
                            } else {
                                return indexLogin_txt.text!.data(using: .utf8)!
                            }
                        }()
                        
                        SecureStorage.save(key: "loggedInStudentIndex", data: index)
                        SecureStorage.save(key: "loggedInStudentProxyIdentifier", data: CsrfTokenManager.shared.proxyIdentifier.data(using: String.Encoding.utf8)!)
                        startDataStreaming(0)
                        overlay.isHidden = true
                        loginPopup.isHidden = true
                        loggedInAs_text.isHidden = false
                        logout_btn.isHidden = false
                        courses_tv.isHidden = false
                    
                        if(saveForBiometrics_switch.isOn){
                            SecureStorage.save(key: "biometricsIndexNumber", data: SecureStorage.load(key: "loggedInStudentIndex")!)
                            SecureStorage.save(key: "biometricsStudentPassword", data: passLogin_txt.text!.data(using: String.Encoding.utf8)!)
                            SecureStorage.save(key: "biometricsStudentProxyIdentifier", data: SecureStorage.load(key: "loggedInStudentProxyIdentifier")!)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                _ = SweetAlert().showAlert("titleCredentialsSaved".localized(), subTitle: "messageCredentialsSaved".localized(), style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                            }
                        }
                    }
                }
                else if(message == "INVALID"){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
                else if(message == "UNKNOWN"){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "loginMessageUnknown".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        _ = SweetAlert().showAlert("loginTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.darkGray) { (isMainButton) -> Void in }
                    }
                }
            }
        }
    }
}
