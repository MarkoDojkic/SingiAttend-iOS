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
        guard let serverUrl = Bundle.main.infoDictionary?["ServerURL"] as? String,
              let username = Bundle.main.infoDictionary?["ServerUsername"] as? String,
              let password = Bundle.main.infoDictionary?["ServerPassword"] as? String else {
            print("Missing server info from Info.plist")
            return
        }
                
        var request = URLRequest(url: URL(string: "\(serverUrl)/api/recordAttendance/\(String(decoding: SecureStorage.load(key: "loggedInStudentIndex")!, as: UTF8.self).replacingOccurrences(of: "/", with: ""))/\(url!)")!)
        request.httpMethod = "GET"
        request.setValue(CsrfTokenManager.shared.proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
        request.setValue("text/plain;charset=UTF-8", forHTTPHeaderField: "Accept")
        request.setValue("Basic \(String(format: "%@:%@", username, password).data(using: .utf8)!.base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        request.setValue(CsrfTokenManager.shared.sessionData.csrfTokenSecret, forHTTPHeaderField: CsrfTokenManager.shared.sessionData.csrfHeaderName)
        let cookieValue = "JSESSIONID=\(CsrfTokenManager.shared.sessionData.jsessionId); XSRF-TOKEN=\(CsrfTokenManager.shared.sessionData.xsrfToken)"
        request.setValue(cookieValue, forHTTPHeaderField: "Cookie")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place while recording attendance: \(error)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    _ = SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceClientError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                }
                return;
            }
            
            if let response = response {
                if ((response as! HTTPURLResponse).statusCode != 200){
                    print("Server error with code \((response as! HTTPURLResponse).statusCode)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        _ = SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceServerError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                    }
                    return;
                }
            }
            
            if let data = data {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if(String(data: data, encoding: .utf8)! == "ALREADY RECORDED ATTENDANCE"){
                        self.class_text.text! += "\n\("alreadyRecordedAttendance".localized())"
                        self.cconfirm_btn.isHidden = true
                    }
                    else if(String(data: data, encoding: .utf8)! == "SUCCESSFULLY RECORDED ATTENDANCE"){
                        self.class_text.text! += "\n\("newlyRecordedAttendance".localized())"
                        self.cconfirm_btn.isHidden = true
                    }
                    else {
                        _ = SweetAlert().showAlert("recordAttendanceFailed".localized(), subTitle: "recordAttendanceUnknownError".localized(), style: AlertStyle.error, buttonTitle:"ok".localized(), buttonColor:UIColor.blue) { (isMainButton) -> Void in }
                    }
                }
            }
        }.resume()
    }
}
