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
        
    @IBAction func recordAttendance(_ sender: UIButton) {
        print(communicateWithServer("RECORDATTENDANCE," + UserDefaults.standard.string(forKey: "loggedInAs")! + ":\(sender.tag)", 2))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialiasation code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Configure the view for selected state
    }
}
