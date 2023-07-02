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
        var request = URLRequest(url: URL(string: Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/recordAttendance/" + UserDefaults.standard.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: "") + "/" + url!)!);
        
        print(Bundle.main.infoDictionary!["ServerURL"]! as! String + "/api/recordAttendance/" + UserDefaults.standard.string(forKey: "loggedInAs")!.replacingOccurrences(of: "/", with: "") + "/" + url!)
        
        request.httpMethod = "GET"
        request.setValue("text/plain", forHTTPHeaderField: "Accept")
        request.setValue("Basic \(String(format: "%@:%@", Bundle.main.infoDictionary!["ServerUsername"]! as! String, Bundle.main.infoDictionary!["ServerPassword"]! as! String).data(using: String.Encoding.utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place while recording attendance: \(error)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceClientError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                }
                return;
            }
            
            if let response = response {
                if ((response as! HTTPURLResponse).statusCode != 200){
                    print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceServerError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                    }
                    return;
                }
            }
            
            if let data = data {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if(String(data: data, encoding: .utf8)! == "ALREADY RECORDED ATTENDANCE"){
                        self.class_text.text! += "\n" + "alreadyRecordedAttendance".localized()
                        self.cconfirm_btn.isHidden = true
                    }
                    else if(String(data: data, encoding: .utf8)! == "SUCCESSFULLY RECORDED ATTENDANCE"){
                        self.class_text.text! += "\n" + "newlyRecordedAttendance".localized()
                        self.cconfirm_btn.isHidden = true
                    }
                    else {
                        SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceUnknownError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                    }
                }
            }
        }.resume()
    }
}
