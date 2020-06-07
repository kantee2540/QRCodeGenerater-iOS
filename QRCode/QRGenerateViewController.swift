//
//  QRGenerateViewController.swift
//  QRCode
//
//  Created by Omp on 3/6/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class QRGenerateViewController: UIViewController {

    @IBOutlet weak var qrImg: UIImageView!
    var num1: String?
    var num2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let billId = "0107555000392"
        if let myqr = generateQR(from: "|\(billId)00\n\(num1!)\n\(num2!)\n0"){
            qrImg.image = myqr
        }
        
    }
    
    private func generateQR(from string: String) -> UIImage?{
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
            let tranform = CGAffineTransform(scaleX: 10, y: 10)
            if let output = filter.outputImage?.transformed(by: tranform){
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }

}
