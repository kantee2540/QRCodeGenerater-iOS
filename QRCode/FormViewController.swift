//
//  ViewController.swift
//  QRCode
//
//  Created by Omp on 3/6/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        number1TextField.delegate = self
        number2TextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qrshow"{
            let destination = segue.destination as! QRGenerateViewController
            destination.num1 = number1TextField.text
            destination.num2 = number2TextField.text
        }
    }

}

extension FormViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if number1TextField.text!.count > 0 && number2TextField.text!.count > 0{
            submitButton.isEnabled = true
        }else{
            submitButton.isEnabled = false
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == number1TextField{
            textField.resignFirstResponder()
            number2TextField.becomeFirstResponder()
        }else if textField == number2TextField{
            textField.resignFirstResponder()
        }
        return true
    }
}
