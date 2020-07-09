//
//  Library.swift
//  QRCode
//
//  Created by Omp on 8/7/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class Library {

}

extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dimissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dimissKeyboard(){
        view.endEditing(true)
    }
}
