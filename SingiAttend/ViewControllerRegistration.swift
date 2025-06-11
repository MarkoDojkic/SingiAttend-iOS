//
//  ViewControllerRegistration.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 17.8.20..
//  Copyright © 2020. Марко Дојкић. All rights reserved.
//

import UIKit

class ViewControllerRegistration: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleReg_text: UILabel!
    @IBOutlet weak var nameSurname_text: UILabel!
    @IBOutlet weak var nameSurname_txt: UITextField!
    @IBOutlet weak var indexReg_text: UILabel!
    @IBOutlet weak var indexReg_txt: UITextField!
    @IBOutlet weak var indexYear_pv: UIPickerView!
    @IBOutlet weak var singimail_text: UILabel!
    @IBOutlet weak var singimail_txt: UITextField!
    @IBOutlet weak var passReg_text: UILabel!
    @IBOutlet weak var passReg_txt: UITextField!
    @IBOutlet weak var facultyS_text: UILabel!
    @IBOutlet weak var copyright_text: UILabel!
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var cancel_btn: UIButton!
    @IBOutlet weak var faculties_pv: UIPickerView!
    @IBOutlet weak var courses_pv: UIPickerView!
    @IBOutlet weak var english_img: UIImageView!
    @IBOutlet weak var serbian_img: UIImageView!
    @IBOutlet weak var englishGroup_sc:UISegmentedControl!
    @IBOutlet weak var serbianGroup_sc:UISegmentedControl!
    
    var faculties = [""]
    var courses: Array<[String:Int]> = []
    var f_courses: [String:Int] = [:]
    let i_years = Array(2000...2999)
    var selectedCourse: String = ""
    var indexYear: Int = -1
    struct Student:Codable {
        var nameSurname: String
        var index: String
        var passwordHash: String
        var email: String
        var studyId: String
        var year: String
    }
        
    override func viewDidLoad() {
        titleReg_text.text = "title_reg".localized()
        copyright_text.text = "copyright".localized()
        nameSurname_text.text = "name_surname".localized()
        nameSurname_txt.placeholder = "hint_namesurname".localized()
        indexReg_text.text = "br_indexa".localized()
        indexReg_txt.placeholder = "hint_index".localized()
        indexYear_pv.delegate = self;
        indexYear_pv.dataSource = self;
        singimail_text.text = "singimail".localized()
        singimail_txt.placeholder = "hint_singimail".localized()
        passReg_text.text = "password".localized()
        passReg_txt.placeholder = "hint_pass".localized()
        facultyS_text.text = "course".localized()
        register_btn.setTitle("confirmreg".localized(), for: UIControl.State.normal)
        register_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        cancel_btn.setTitle("cancel".localized(), for: UIControl.State.normal)
        cancel_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        serbianGroup_sc.setTitle("bg".localized(), forSegmentAt: 0)
        serbianGroup_sc.setTitle("ns".localized(), forSegmentAt: 1)
        serbianGroup_sc.setTitle("nis".localized(), forSegmentAt: 2)
        englishGroup_sc.setTitle("bg".localized(), forSegmentAt: 0)
        englishGroup_sc.setTitle("ns".localized(), forSegmentAt: 1)
        englishGroup_sc.setTitle("nis".localized(), forSegmentAt: 2)
        
        faculties_pv.delegate = self
        faculties_pv.dataSource = self
        courses_pv.delegate = self
        courses_pv.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        english_img.alpha = 0.55
        english_img.layer.borderColor = UIColor.green.cgColor
        serbian_img.alpha = 0.55
        serbian_img.layer.borderColor = UIColor.green.cgColor
        serbianGroup_sc.selectedSegmentIndex = UISegmentedControl.noSegment
        englishGroup_sc.selectedSegmentIndex = UISegmentedControl.noSegment
    }
    
    @IBAction func onCancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        
        if(nameSurname_txt.text!.isEmpty || nameSurname_txt.text!.count < 2) {
            nameSurname_txt.backgroundColor = UIColor.red
            return
        }
        else {
            nameSurname_txt.backgroundColor = UIColor.green
        }
        
        if(indexYear == -1){
            indexYear_pv.backgroundColor = UIColor.red
            return
        }
        else {
            indexYear_pv.backgroundColor = UIColor.green
        }
        
        if(indexReg_txt.text!.isEmpty || indexReg_txt.text!.count != 6) {
            indexReg_txt.backgroundColor = UIColor.red
            return
        }
        else {
            indexReg_txt.backgroundColor = UIColor.green
        }
        
        do {
            let regex = try NSRegularExpression(pattern: "^[a-z]+\\.[a-z]+\\.[0-9]{2,3}@singimail.rs$", options: NSRegularExpression.Options.caseInsensitive)

            if(!regex.matches(singimail_txt.text!)){
                singimail_txt.backgroundColor = UIColor.red
                return
            }
            else {
                singimail_txt.backgroundColor = UIColor.green
            }
        } catch {}
        
        if(passReg_txt.text!.isEmpty || passReg_txt.text!.count < 8) {
            passReg_txt.backgroundColor = UIColor.red
            return
        }
        else {
            passReg_txt.backgroundColor = UIColor.green
        }
        
        if(CsrfTokenManager.shared.proxyIdentifier.isEmpty){
            facultyS_text.backgroundColor = UIColor.red
            return
        } else {
            facultyS_text.backgroundColor = UIColor.green
        }
        
        if(selectedCourse.isEmpty) {
            faculties_pv.backgroundColor = UIColor.red
            courses_pv.backgroundColor = UIColor.red
            return
        }
        else {
            faculties_pv.backgroundColor = UIColor.green
            courses_pv.backgroundColor = UIColor.green
        }
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        var sCourseId:String;
        
        switch selectedCourse {
            case "1": sCourseId = "61b612d3e1534b76962f2564"; break;
            case "2": sCourseId = "61b612d3e1534b76962f256b"; break;
            case "3": sCourseId = "61b612d3e1534b76962f2563"; break;
            case "4": sCourseId = "61b612d3e1534b76962f256e"; break;
            case "5": sCourseId = "61b612d3e1534b76962f2566"; break;
            case "6": sCourseId = "61b612d3e1534b76962f2569"; break;
            case "7": sCourseId = "61b612d3e1534b76962f2571"; break;
            case "8": sCourseId = "61b612d3e1534b76962f256a"; break;
            case "9": sCourseId = "61b612d3e1534b76962f2565"; break;
            case "10": sCourseId = "61b612d3e1534b76962f2568"; break;
            case "11": sCourseId = "61b612d3e1534b76962f256d"; break;
            case "12": sCourseId = "61b612d3e1534b76962f2572"; break;
            case "13": sCourseId = "61b612d3e1534b76962f256c"; break;
            case "14": sCourseId = "61b612d3e1534b76962f256f"; break;
            case "15": sCourseId = "61b612d3e1534b76962f2570"; break;
            case "16": sCourseId = "61c7328fe22ce55efb31ac02"; break;
            default: sCourseId = "";
        }
                
        do {
            if let jsonData = try? jsonEncoder.encode(Student(nameSurname: nameSurname_txt.text!, index: String(indexYear) + "/" + indexReg_txt.text!, passwordHash: passReg_txt.text!, email: singimail_txt.text!, studyId: sCourseId, year: String(Int.random(in: Int(selectedCourse) == 16 ? 1...5 : 1...4)))) {
                register(jsonData) { response in
                    if let statusCode = response {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if statusCode == 200 {
                                _ = SweetAlert().showAlert("regTitleSuccess".localized(), subTitle: "regMessageSuccess".localized(), style: .success, buttonTitle:"ok".localized(), buttonColor: UIColor.blue) { _ in
                                    CsrfTokenManager.shared.logoutFromCsrfSession()
                                    self.dismiss(animated: true)
                                }
                            } else if statusCode == 500 {
                                _ = SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "regMessageFailed".localized(), style: .error, buttonTitle:"ok".localized(), buttonColor: UIColor.blue)
                            } else {
                                _ = SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: .warning, buttonTitle:"ok".localized(), buttonColor: UIColor.blue)
                            }
                        }
                    }
                }
            } else {
                print("Failed to encode student JSON")
                _ = SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "regMessageFailed".localized(), style: .error, buttonTitle:"ok".localized(), buttonColor: UIColor.blue)
            }

        }
    }
        
    @IBAction func checkSingimail(_ sender: UITextField) {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-z]+\\.[a-z]+\\.[0-9]{2,3}@$", options: NSRegularExpression.Options.caseInsensitive)
            if(regex.matches(sender.text!)){
                sender.text = sender.text! + "singimail.rs"
                sender.maxLength = sender.text!.count
            }
        } catch {}
    }
    
    @IBAction func populate_english(_ sender: UISegmentedControl) {
        serbianGroup_sc.selectedSegmentIndex = UISegmentedControl.noSegment
        serbian_img.layer.borderWidth = 0
        english_img.layer.borderWidth = 1
        
        faculties = ["f_bb".localized(),"f_th".localized(),"f_ic".localized(),"f_ts".localized(),"f_su".localized()]
        courses = [["be_eng".localized():10,"ang_eng".localized():11],["theh_eng".localized():12],["it_eng".localized():13],["sde_eng".localized():14],["esd_eng".localized():15]]
        
        switch sender.selectedSegmentIndex {
            case 0:
                CsrfTokenManager.shared.proxyIdentifier = "SingidunumBG"
                break
            case 1:
                CsrfTokenManager.shared.proxyIdentifier = "SingidunumNS"
                faculties.remove(at: 4)
                courses.remove(at: 4)
                break
            case 2:
                CsrfTokenManager.shared.proxyIdentifier = "SingidunumNIS"
                faculties.remove(at: 4)
                courses.remove(at: 4)
                break
            default:
                CsrfTokenManager.shared.proxyIdentifier = ""
                break
        }
        
        faculties_pv.reloadAllComponents()
        courses_pv.reloadAllComponents()
    }
    
    @IBAction func populate_serbian(_ sender: UISegmentedControl) {
        englishGroup_sc.selectedSegmentIndex = UISegmentedControl.noSegment
        english_img.layer.borderWidth = 0
        serbian_img.layer.borderWidth = 1
        
        faculties = ["f_bb".localized(),"f_th".localized(),"f_ic".localized(),"f_ts".localized(),"f_ps".localized(),"f_su".localized()]
        courses = [["be_srb".localized():1,"ang_srb".localized():2],["theh_srb".localized():3],["cs_srb".localized():4,"it_srb".localized():5],["sde_srb".localized():6],["pes_srb".localized():7,"ms_srb".localized():8],["esd_srb".localized():9, "f_srb".localized():16]]
        
        switch sender.selectedSegmentIndex {
            case 0:
                CsrfTokenManager.shared.proxyIdentifier = "SingidunumBG"
                break
            case 1:
                CsrfTokenManager.shared.proxyIdentifier = "SingidunumNS"
                faculties.remove(at: 4)
                courses.remove(at: 4)
                break
            case 2:
                CsrfTokenManager.shared.proxyIdentifier = "SingidunumNIS"
                faculties.remove(at: 3)
                faculties.remove(at: 4)
                courses.remove(at: 3)
                courses.remove(at: 4)
                break
            default:
                CsrfTokenManager.shared.proxyIdentifier = ""
                break
        }
        
        faculties_pv.reloadAllComponents()
        courses_pv.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 { return faculties.count }
        else if pickerView.tag == 1 { return f_courses.count }
        else if pickerView.tag == 2 { return i_years.count }
        else { return 0 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 { return faculties[row].isEmpty ? faculties[0] : faculties[row] }
        else if pickerView.tag == 1 { return f_courses[f_courses.index(f_courses.startIndex, offsetBy: row)].key }
        else if pickerView.tag == 2 { return String(i_years[row])}
        else { return "" }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView.tag == 0 {
            f_courses = courses[row]
            courses_pv.reloadAllComponents()
        }
        else if pickerView.tag == 1 {
            selectedCourse = String(f_courses[f_courses.index(f_courses.startIndex, offsetBy: row)].value)
        }
        else if pickerView.tag == 2 {
            indexYear = i_years[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "Ropa Sans", size: 8)
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.adjustsFontSizeToFitWidth = true
        
        if pickerView.tag == 0 {
            pickerLabel.text = faculties[row]
        }
        else if pickerView.tag == 1 {
            pickerLabel.text = f_courses[f_courses.index(f_courses.startIndex, offsetBy: row)].key
        }
        else if pickerView.tag == 2 {
            pickerLabel.text = String(i_years[row])
        }
        
        return pickerLabel
    }
    
    func register(_ data:Data, completionHandler: @escaping (Int?) -> Void) {
        CsrfTokenManager.shared.fetchCsrfSession { success in
            if success {
                guard let serverUrl = Bundle.main.infoDictionary?["ServerURL"] as? String,
                      let username = Bundle.main.infoDictionary?["ServerUsername"] as? String,
                      let password = Bundle.main.infoDictionary?["ServerPassword"] as? String else {
                    print("Missing server info from Info.plist")
                    completionHandler(400)
                    return
                }
                
                var request = URLRequest(url: URL(string: "\(serverUrl)/api/insert/student")!)
                request.httpMethod = "POST"
                request.httpBody = data
                request.setValue(CsrfTokenManager.shared.proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
                request.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Accept")
                request.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
                request.setValue("Basic \(String(format: "%@:%@", username, password).data(using: .utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
                
                // Add CSRF headers
                request.setValue(CsrfTokenManager.shared.sessionData.csrfTokenSecret, forHTTPHeaderField: CsrfTokenManager.shared.sessionData.csrfHeaderName)
                let cookieValue = "JSESSIONID=\(CsrfTokenManager.shared.sessionData.jsessionId); XSRF-TOKEN=\(CsrfTokenManager.shared.sessionData.xsrfToken)"
                request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
                
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print("Error took place while sending registration data: \(error)")
                        completionHandler(400)
                        return
                    }
                    
                    if let response = response {
                        completionHandler((response as! HTTPURLResponse).statusCode)
                    }
                }.resume()
                
            } else {
                print("Failed to fetch CSRF session")
                completionHandler(400)
            }
        }
    }
}
