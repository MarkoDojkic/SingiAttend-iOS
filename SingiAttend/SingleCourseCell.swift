//
//  SingleCourseCell.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 7.9.20..
//  Copyright © 2020. Марко Дојкић. All rights reserved.
//

import UIKit

class SingleCourseCell : UITableViewCell {
    
    @IBOutlet weak var class_text: UILabel!
    @IBOutlet weak var cconfirm_btn: UIButton!
    var url: String!
            
    @IBAction func recordAttendance(_ sender: UIButton) {
        var request = URLRequest(url: URL(string: "http://192.168.0.196:62812/api/recordAttendance/" + UserDefaults.standard.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: "") + "/" + url!)!);
        
        request.httpMethod = "GET"
        request.setValue("text/plain", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place while recording attendance: \(error)")
                DispatchQueue.main.async {
                    _ = SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceClientError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                }
                return;
            }
            
            if let response = response {
                if ((response as! HTTPURLResponse).statusCode != 200){
                    print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                    DispatchQueue.main.async {
                        _ = SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceServerError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                    }
                    return;
                }
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    if(String(data: data, encoding: .utf8)! == "ALREADY RECORDED ATTENDANCE"){
                        self.class_text.text! += "\n" + "alreadyRecordedAttendance".localized()
                        self.cconfirm_btn.isHidden = true
                    }
                    else if(String(data: data, encoding: .utf8)! == "SUCCESSFULLY RECORDED ATTENDANCE"){
                        self.class_text.text! += "\n" + "newlyRecordedAttendance".localized() +  String(data: data, encoding: .utf8)!.split(separator: "*")[1]
                        self.cconfirm_btn.isHidden = true
                    }
                    else {
                        _ = SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceUnknownError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isOtherButton) -> Void in }
                    }
                }
            }
        }.resume()
    }
}
