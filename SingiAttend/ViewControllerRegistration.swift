//
//  ViewControllerRegistration.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 17.8.20..
//  Copyright © 2020. Марко Дојкић. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewControllerRegistration: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleReg_text: UILabel!
    @IBOutlet weak var nameSurname_text: UILabel!
    @IBOutlet weak var nameSurname_txt: UITextField!
    @IBOutlet weak var indexReg_text: UILabel!
    @IBOutlet weak var indexReg_txt: UITextField!
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
    @IBOutlet weak var f_temp: UILabel!
    @IBOutlet weak var c_temp: UILabel!
    
    let localStorage = UserDefaults.standard
    var faculties = [""]
    var courses = [[""]]
    var f_courses = [""]
    
    override func viewDidLoad() {
        titleReg_text.text = "title_reg".localized()
        copyright_text.text = "copyright".localized()
        nameSurname_text.text = "name_surname".localized()
        nameSurname_txt.placeholder = "hint_namesurname".localized()
        indexReg_text.text = "br_indexa".localized()
        indexReg_txt.placeholder = "hint_index".localized()
        singimail_text.text = "singimail".localized()
        singimail_txt.placeholder = "hint_singimail".localized()
        passReg_text.text = "password".localized()
        passReg_txt.placeholder = "hint_pass".localized()
        facultyS_text.text = "course".localized()
        register_btn.setTitle("confirmreg".localized(), for: UIControl.State.normal)
        faculties_pv.delegate = self
        faculties_pv.dataSource = self
        courses_pv.delegate = self
        courses_pv.delegate = self
    }
    
    @IBAction func register(_ sender: UIButton) {
        
        if(nameSurname_txt.text!.isEmpty || nameSurname_txt.text!.count < 2) {
            nameSurname_txt.backgroundColor = UIColor.red
            return
        }
        else {
            nameSurname_txt.backgroundColor = UIColor.green
        }
        
        if(indexReg_txt.text!.isEmpty || indexReg_txt.text!.count != 11) {
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
        
        if(f_temp.text! == "faculty_temp") {
            faculties_pv.backgroundColor = UIColor.red
            return
        }
        else {
            faculties_pv.backgroundColor = UIColor.green
        }

        if(c_temp.text! == "course_temp") {
            courses_pv.backgroundColor = UIColor.red
            return
        }
        else {
            courses_pv.backgroundColor = UIColor.green
        }
        
        
        let cData = nameSurname_txt.text! + "*" + indexReg_txt.text! + "*" + singimail_txt.text! + "*" + passReg_txt.text! + "*" + f_temp.text! + "*" + c_temp.text!
        print(cData)
        let response = communicateWithServer(cData, 20)
        
        if(response == "APPROVED\n"){
            _ = SweetAlert().showAlert("regTitleSuccess".localized(), subTitle: "regMessageSuccess".localized(), style: AlertStyle.success, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in
                if isOtherButton == true {
                    self.performSegue(withIdentifier: "toMain", sender: sender)
                }
            }
        }
        else if(response == "DENIED\n"){
            _ = SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "regMessageFailed".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
        }
        else {
            _ = SweetAlert().showAlert("regTitleFailed".localized(), subTitle: "serverMessageError".localized(), style: AlertStyle.warning, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
        }
    }
    
    @IBAction func checkIndex(_ sender: Any) {
        if(indexReg_txt.text!.count == 5 && indexReg_txt.text?.last != "/"){
            indexReg_txt.text!.insert("/", at: indexReg_txt.text!.index(before: indexReg_txt.text!.endIndex))
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
        courses = [["be_eng".localized(),"ang_eng".localized()],["theh_eng".localized()],["it_eng".localized()],["sde_eng".localized()],["esd_eng".localized()]]
        eng_btn.layer.borderWidth = 2.0
        eng_btn.layer.borderColor = UIColor.green.cgColor
        srb_btn.layer.borderWidth = 0.0
        faculties_pv.reloadAllComponents()
        courses_pv.reloadAllComponents()
    }
    
    @IBAction func populate_serbian(_ sender: Any) {
        faculties = ["f_bb".localized(),"f_th".localized(),"f_ic".localized(),"f_ts".localized(),"f_ps".localized(),"f_su".localized()]
        courses = [["be_srb".localized(),"ang_srb".localized()],["theh_srb".localized()],["cs_srb".localized(),"it_srb".localized()],["sde_srb".localized()],["pes_srb".localized(),"ms_srb".localized()],["esd_srb".localized()]]
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
        else { return f_courses.count }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 { return faculties[row].isEmpty ? faculties[0] : faculties[row] }
        else { return f_courses[row] }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView.tag == 0 {
            f_temp.text? = faculties[row]
            f_courses = courses[row]
            courses_pv.reloadAllComponents()
        }
        else if pickerView.tag == 1 {
            c_temp.text? = f_courses[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if pickerView.tag == 0 {
            pickerLabel.font = UIFont(name: "Ropa Sans", size: 20)
            pickerLabel.textAlignment = NSTextAlignment.center
            pickerLabel.text = faculties[row]
        }
        else {
            pickerLabel.font = UIFont(name: "Ropa Sans", size: 2)
            pickerLabel.textAlignment = NSTextAlignment.center
            pickerLabel.text = f_courses[row]
        }
        
        return pickerLabel
    }
}
