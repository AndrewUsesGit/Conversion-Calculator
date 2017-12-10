//
//  ConversionCalcViewController.swift
//  Conversion Calculator
//
//  Created by Andrew W Stoll on 12/10/17.
//  Copyright © 2017 Andrew W Stoll. All rights reserved.
//

import UIKit

class ConversionCalcViewController: UIViewController {

    var options:[String] = ["fahrenheit to celcius", "celcius to fahrenheit", "miles to kilometers", "kilometers to miles"]
    var currentChoice:Int = 0
    var rawValue = ""
    var convertedValue = ""
    var tempFloat:Float?
    var signChar = ""
    var negFlag = false
    
    @IBOutlet weak var rawTextField: UITextField!
    @IBOutlet weak var convertedTextField: UITextField!
    
    @IBAction func appendToRawValue(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        if let character = button.titleLabel?.text{
            rawValue = rawValue + character
            updateTextFields()
        }
        
    }
    
    @IBAction func clear(_ sender: Any) {
        rawValue = ""
        convertedValue = ""
        negFlag = false
        signChar = ""
        updateTextFields()
    }
    
    @IBAction func toggleSign(_ sender: Any) {
        negFlag = !negFlag
        if negFlag{
            signChar = "-"
        }else{
            signChar = ""
        }
        updateTextFields()
    }
    
    @IBAction func selectConversion(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: options[0], style: UIAlertActionStyle.default, handler: {
            (alertAction)->Void in
                self.currentChoice = 0
                self.updateTextFields()
        }))
        alert.addAction(UIAlertAction(title: options[1], style: UIAlertActionStyle.default, handler: {
            (alertAction)->Void in
            self.currentChoice = 1
            self.updateTextFields()
        }))
        alert.addAction(UIAlertAction(title: options[2], style: UIAlertActionStyle.default, handler: {
            (alertAction)->Void in
            self.currentChoice = 2
            self.updateTextFields()
        }))
        alert.addAction(UIAlertAction(title: options[3], style: UIAlertActionStyle.default, handler: {
            (alertAction)->Void in
            self.currentChoice = 3
            self.updateTextFields()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func updateTextFields(){
        switch currentChoice {
        case 0:
            if let tempFloat = Float(signChar+rawValue){
                convertedValue = "\((tempFloat-32)/1.8)"
            }else{
                convertedValue = ""
            }
            
            rawTextField.text = signChar + rawValue + " °F"
            convertedTextField.text = convertedValue + " °C"
        case 1:
            if let tempFloat = Float(signChar+rawValue){
                convertedValue = "\((tempFloat*1.8)+32)"
            }else{
                convertedValue = ""
            }
            
            rawTextField.text = signChar + rawValue + " °C"
            convertedTextField.text = convertedValue + " °F"
        case 2:
            if let tempFloat = Float(signChar+rawValue){
                convertedValue = "\(tempFloat * 1.609344)"
            }else{
                convertedValue = ""
            }
            
            rawTextField.text = signChar + rawValue + " mi"
            convertedTextField.text = convertedValue + " km"
        case 3:
            if let tempFloat = Float(signChar+rawValue){
                convertedValue = "\(tempFloat / 1.609344)"
            }else{
                convertedValue = ""
            }
            
            rawTextField.text = signChar + rawValue + " km"
            convertedTextField.text = convertedValue + " mi"
        default:
            print("Major error in code design")
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTextFields()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
