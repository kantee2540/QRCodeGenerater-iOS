//
//  ViewController.swift
//  QRCode
//
//  Created by Omp on 3/6/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var ref1Textfield: CustomTextfield!
    @IBOutlet weak var ref2Textfield: CustomTextfield!
    @IBOutlet weak var amountTextfield: CustomTextfield!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        
        ref1Textfield.delegate = self
        ref2Textfield.delegate = self
        amountTextfield.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qrshow"{
            let destination = segue.destination as! QRGenerateViewController
            destination.ref1 = ref1Textfield.text
            destination.ref2 = ref2Textfield.text
            
            var totalAmount = ""
            let amountStr = amountTextfield.text!
            if amountStr.contains("."){
                let pointIndex = amountStr.index(amountStr.firstIndex(of: ".")!, offsetBy: 0)
                let decimalIndex = amountStr.index(amountStr.firstIndex(of: ".")!, offsetBy: 1)
                let lastIndex = amountStr.endIndex
                let IntNum = amountStr[amountStr.startIndex..<pointIndex]
                let decimalNum = "\(amountStr[decimalIndex..<lastIndex])"
                if decimalNum.count >= 2{
                    totalAmount = "\(IntNum)\(decimalNum)"
                }else{
                    totalAmount = "\(IntNum)\(decimalNum)0"
                }
                print(totalAmount)
            }
            else{
                totalAmount = "\(amountStr)00"
            }
            destination.amount = totalAmount
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= 85
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
        
    }

}

extension FormViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if ref1Textfield.text!.count > 0 && ref2Textfield.text!.count > 0{
            submitButton.isEnabled = true
        }else{
            submitButton.isEnabled = false
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == ref1Textfield{
            textField.resignFirstResponder()
            ref2Textfield.becomeFirstResponder()
        }else if textField == ref2Textfield{
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setUnderlined()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setUnderlined()
    }
}
