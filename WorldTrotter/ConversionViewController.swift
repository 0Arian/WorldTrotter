//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Arian Moslem on 5/19/16.
//  Copyright © 2016 Arian Moslem. All rights reserved.
//

import Foundation
import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    //Number Formatter to make the # Look Better
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, number = numberFormatter.numberFromString(text){
            fahrenheitValue = number.doubleValue
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textfield: UITextField, shouldChangeCharactersInRange range : NSRange, replacementString string: String) -> Bool {
        let currentLocale = NSLocale.currentLocale()
        let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)
        let letters = NSCharacterSet.letterCharacterSet()
        if string.lowercaseString.rangeOfCharacterFromSet(letters) != nil {
            return false
        }
        else{
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            }
            else{
                return true
            }
        }
    }
    
    override func viewDidLoad() {
        //Always call the super implementation of viewdidload
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
    //Sets the background color to dark grey if its night time, else the background color will be green
    override func viewWillAppear(animated: Bool) {
        let currentHour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        if(currentHour >= 18){
            self.view.backgroundColor = UIColor.blueColor()
        }
        else{
            self.view.backgroundColor = UIColor.cyanColor()
        }
    }
}