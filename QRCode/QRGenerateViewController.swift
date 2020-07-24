//
//  QRGenerateViewController.swift
//  QRCode
//
//  Created by Omp on 3/6/2563 BE.
//  Copyright © 2563 Omp. All rights reserved.
//

import UIKit

class QRGenerateViewController: UIViewController {

    @IBOutlet weak var ref1Label: UILabel!
    @IBOutlet weak var ref2Label: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var barcodeCodeLabel: UILabel!
    @IBOutlet weak var qrImg: UIImageView!
    @IBOutlet weak var barcodeImg: UIImageView!
    var ref1: String?
    var ref2: String?
    var amount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let billId = UserDefaults.standard.string(forKey: "taxid")
        let amountInt = formatDecimal(amountStr: amount!)
        let codeFormat = "|\(billId!)00\n\(ref1!)\n\(ref2!)\n\(amountInt)"
        
        ref1Label.text = ref1
        ref2Label.text = ref2
        if !amount!.contains(".") && amount != ""{
            amountLabel.text = "\(amount!).00"
        }else if amount == ""{
            amountLabel.text = "0.00"
        }
        else{
            amountLabel.text = amount
        }
        
        if let myqr = generateQR(from: codeFormat){
            qrImg.image = myqr
        }
        
        if let myBarcode = generateBarcode(from: codeFormat){
            let barcode = "\(billId!) \(ref1!) \(ref2!) \(amountInt)"
            barcodeCodeLabel.text = barcode
            barcodeImg.image = myBarcode
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
    
    private func generateBarcode(from string: String) -> UIImage?{
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
            let tranform = CGAffineTransform(scaleX: 10, y: 10)
            if let output = filter.outputImage?.transformed(by: tranform){
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    private func formatDecimal(amountStr: String) -> String{
        if amountStr.contains("."){
            let pointIndex = amountStr.index(amountStr.firstIndex(of: ".")!, offsetBy: 0)
            let decimalIndex = amountStr.index(amountStr.firstIndex(of: ".")!, offsetBy: 1)
            let lastIndex = amountStr.endIndex
            let IntNum = amountStr[amountStr.startIndex..<pointIndex]
            let decimalNum = "\(amountStr[decimalIndex..<lastIndex])"
            if decimalNum.count >= 2{
                return "\(IntNum)\(decimalNum)"
            }else{
                return "\(IntNum)\(decimalNum)0"
            }
        }
        else{
            return "\(amountStr)00"
        }
    }

}
