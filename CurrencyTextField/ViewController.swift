//
//  ViewController.swift
//  CurrencyTextField
//
//  Created by Daisuke TONOSAKI on 2020/04/27.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField?.keyboardType = .numberPad
        textField?.addTarget(self,
                             action: #selector(textFieldDidChange(textField:)),
                             for: .editingChanged)
    }
    
    
    @objc
    func textFieldDidChange(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        
        
        // Get number from text.
        var numText = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        numText = String(numText.prefix(9))
        guard let num = Int(numText) else {
            textField.text = ""
            return
        }
        
        
        // Currency formatting.
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "JPY"
        
        
        // Set currency text to textfield.
        let formatedText = formatter.string(from: num as NSNumber)
        
        textField.text = formatedText
    }
    
}

