//
//  SubmitButton.swift
//  QRCode
//
//  Created by Omp on 9/7/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class SubmitButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                self.backgroundColor = UIColor.init(named: "seg-color-press")
            }else{
                self.backgroundColor = UIColor.init(named: "seg-color")
            }
        }
    }
    
    override var isEnabled: Bool{
        didSet{
            if isEnabled{
                self.backgroundColor = UIColor.init(named: "seg-color")
            }else{
                self.backgroundColor = UIColor.lightGray
            }
        }
    }
}
