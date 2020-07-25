//
//  TaxIDViewController.swift
//  QRCode
//
//  Created by Omp on 24/7/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

protocol TaxIDDelegate {
    func dismissFromtaxID()
}

class TaxIDViewController: UIViewController, UITextFieldDelegate {

    var delegate: TaxIDDelegate?
    @IBOutlet weak var taxTextfield: CustomTextfield!
    @IBOutlet weak var companyTextfield: CustomTextfield!
    @IBOutlet weak var submitButton: SubmitButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taxID = UserDefaults.standard.string(forKey: "taxid")
        let company = UserDefaults.standard.string(forKey: "companyname")
        taxTextfield.text = taxID
        companyTextfield.text = company
        taxTextfield.delegate = self
        companyTextfield.delegate = self
        taxTextfield.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func tapchangeTax(_ sender: Any) {
        let newTax = taxTextfield.text
        let newCompany = companyTextfield.text
        UserDefaults.standard.set(newTax, forKey: "taxid")
        UserDefaults.standard.set(newCompany, forKey: "companyname")
        delegate?.dismissFromtaxID()
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if taxTextfield.text!.count >= 10 && !companyTextfield.text!.isEmpty{
            submitButton.isEnabled = true
        }else{
            submitButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        
        return false
    }
}
