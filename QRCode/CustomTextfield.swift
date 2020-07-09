//
//  CustomTextfield.swift
//  QRCode
//
//  Created by Omp on 8/7/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class CustomTextfield: UITextField, UITextFieldDelegate {
    
    override func awakeFromNib() {
        self.setUnderlined()
    }
}

extension UITextField{
    func setUnderlined(){
        
        let border = CALayer()
        let width = CGFloat(2)
        if isEditing{
            border.borderColor = UIColor.init(named: "seg-color")?.cgColor
        }else{
            border.borderColor = UIColor.lightGray.cgColor
        }
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: UIScreen.main.bounds.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
