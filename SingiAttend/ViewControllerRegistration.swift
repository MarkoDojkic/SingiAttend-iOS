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
    @IBOutlet weak var faculties_pv: UIPickerView!
    @IBOutlet weak var courses_pv: UIPickerView!
    @IBOutlet weak var eng_btn: UIButton!
    @IBOutlet weak var srb_btn: UIButton!
    
    let localStorage = UserDefaults.standard
    var faculties = [""]
    var courses: Array<[String:Int]> = []
    var f_courses: [String:Int] = [:]
    let i_years = Array(2000...2999)
    var selectedCourse: String = ""
    var indexYear: Int = -1
    struct Student:Codable {
        var name_surname: String
        var index: String
        var password_hash: String
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
        
        faculties_pv.delegate = self
        faculties_pv.dataSource = self
        courses_pv.delegate = self
        courses_pv.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
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
            let jsonData = try? jsonEncoder.encode(Student(name_surname: nameSurname_txt.text!, index: String(indexYear) + "/" + indexReg_txt.text!, password_hash: passReg_txt.text!, email: singimail_txt.text!, studyId: sCourseId, year: String(Int.random(in: Int(selectedCourse) == 16 ? 1...5 : 1...4))))
            register(jsonData!, completionHandler: {
                response in
                if let statusCode = response {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { //To fix Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread
                        if(statusCode == 200){
                            SweetAlert().showAlert("regTitleSuccess".localized(), subTitle: "regMessageSuccess".localized(), style: AlertStyle.success, buttonTitle: "rememberCredentials".localized(), buttonColor: UIColor.green, otherButtonTitle:"ok".localized(), otherButtonColor:UIColor.blue) { [self] (isMainButton) -> Void in
                                if(isMainButton) {
                                    try? KeychainPasswordItem(account: String(self.indexYear) + "/" + self.indexReg_txt.text!).savePassword(self.passReg_txt.text!)
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        SweetAlert().showAlert("titleCredentialsSaved".localized(), subTitle: "messageCredentialsSaved".localized(), style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                                        
                                        self.performSegue(withIdentifier: "toMain", sender: sender)
                                    }
                                } else {
                                    self.performSegue(withIdentifier: "toMain", sender: sender)
                                }
                            }
                        }
                        else if(statusCode == 500){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "regMessageFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                            }
                        }
                        else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                            }
                        }
                    }
                }
            })
        }
    }
        
    @IBAction func checkSingimail(_ sender: Any) {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-z]+\\.[a-z]+\\.[0-9]{2,3}@$", options: NSRegularExpression.Options.caseInsensitive)
            if(regex.matches(singimail_txt.text!)){
                singimail_txt.text = singimail_txt.text! + "singimail.rs"
                singimail_txt.maxLength = singimail_txt.text!.count
            }
        } catch {}
    }
    
    @IBAction func populate_engish(_ sender: Any) {
        faculties = ["f_bb".localized(),"f_th".localized(),"f_ic".localized(),"f_ts".localized(),"f_su".localized()]
        courses = [["be_eng".localized():10,"ang_eng".localized():11],["theh_eng".localized():12],["it_eng".localized():13],["sde_eng".localized():14],["esd_eng".localized():15]]
        eng_btn.layer.borderWidth = 2.0
        eng_btn.layer.borderColor = UIColor.green.cgColor
        srb_btn.layer.borderWidth = 0.0
        faculties_pv.reloadAllComponents()
        courses_pv.reloadAllComponents()
    }
    
    @IBAction func populate_serbian(_ sender: Any) {
        faculties = ["f_bb".localized(),"f_th".localized(),"f_ic".localized(),"f_ts".localized(),"f_ps".localized(),"f_su".localized()]
        courses = [["be_srb".localized():1,"ang_srb".localized():2],["theh_srb".localized():3],["cs_srb".localized():4,"it_srb".localized():5],["sde_srb".localized():6],["pes_srb".localized():7,"ms_srb".localized():8],["esd_srb".localized():9, "f_srb".localized():16]]
        srb_btn.layer.borderWidth = 2.0
        srb_btn.layer.borderColor = UIColor.green.cgColor
        eng_btn.layer.borderWidth = 0.0
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
        pickerLabel.font = UIFont(name: "Ropa Sans", size: 4)
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.adjustsFontSizeToFitWidth = true
        pickerLabel.sizeToFit()
        
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
        var request = URLRequest(url: URL(string: Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/insert/student")!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic \(String(format: "%@:%@", Bundle.main.infoDictionary!["ServerUsername"]! as! String, Bundle.main.infoDictionary!["ServerPassword"]! as! String).data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place while sending registration data: \(error)")
                completionHandler(400)
            }
            
            if let response = response {
                completionHandler((response as! HTTPURLResponse).statusCode)
            }
        }.resume()
    }
}
