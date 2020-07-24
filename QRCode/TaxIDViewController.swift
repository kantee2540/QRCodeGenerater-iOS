//
//  TaxIDViewController.swift
//  QRCode
//
//  Created by Omp on 24/7/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class TaxIDViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taxTextfield: CustomTextfield!
    @IBOutlet weak var submitButton: SubmitButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taxID = UserDefaults.standard.string(forKey: "taxid")
        taxTextfield.text = taxID
        taxTextfield.delegate = self
        taxTextfield.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func tapchangeTax(_ sender: Any) {
        let newTax = taxTextfield.text
        UserDefaults.standard.set(newTax, forKey: "taxid")
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func tapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setUnderlined()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.setUnderlined()
    }
}
