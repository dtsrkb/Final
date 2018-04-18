//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Drew Smith on 4/9/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var inputNumber:Double? = nil
    var outputNumber:Double? = nil
    var inputUnit = ""
    var outputUnit = ""
    var conversionCase = 0
    var usedDecimal = false

    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    struct converterStruct {
        var label: String
        var inputUnit: String
        var outputUnit: String
    }
    
    var converterArray: [converterStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converterArray.append(converterStruct(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        converterArray.append(converterStruct(label: "celcious to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        converterArray.append(converterStruct(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        converterArray.append(converterStruct(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
        
        self.inputUnit = self.converterArray[0].inputUnit
        self.outputUnit = self.converterArray[0].outputUnit
        self.outputDisplay.text = " " + self.outputUnit
        self.inputDisplay.text = " " + self.inputUnit
        conversionCase = 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButton(_ sender: Any) {
        // this example uses the .actionSheet style.  It could be set to another style such as .alert
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: self.converterArray[0].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice A
            self.outputUnit = self.converterArray[0].outputUnit
            self.outputDisplay.text = self.outputDisplayText +  " " + self.outputUnit
            self.inputUnit = self.converterArray[0].inputUnit
            self.inputDisplay.text = self.inputDisplayText + " " + self.inputUnit
            self.conversionCase = 1
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        alert.addAction(UIAlertAction(title: self.converterArray[1].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice B
            self.outputUnit = self.converterArray[1].outputUnit
            self.outputDisplay.text = self.outputDisplayText + " " + self.outputUnit
            self.inputUnit = self.converterArray[1].inputUnit
            self.inputDisplay.text = self.inputDisplayText + " " + self.inputUnit
            self.conversionCase = 2
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        alert.addAction(UIAlertAction(title: self.converterArray[2].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice C
            self.outputUnit = self.converterArray[2].outputUnit
            self.outputDisplay.text = self.outputDisplayText + " " + self.outputUnit
            self.inputUnit = self.converterArray[2].inputUnit
            self.inputDisplay.text = self.inputDisplayText + " " + self.inputUnit
            self.conversionCase = 3
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        alert.addAction(UIAlertAction(title: self.converterArray[3].label, style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            // handle choice D
            self.outputUnit = self.converterArray[3].outputUnit
            self.outputDisplay.text = self.outputDisplayText + " " + self.outputUnit
            self.inputUnit = self.converterArray[3].inputUnit
            self.inputDisplay.text = self.inputDisplayText + " " + self.inputUnit
            self.conversionCase = 4
            if self.inputNumber != nil {
                self.conversion()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    var inputDisplayText: String = ""
    
    var outputDisplayText: String = ""
    
    @IBAction func numbers(_ sender: UIButton) {
        if sender.tag != 11 {
            inputDisplayText.append(String(sender.tag - 1))
        } else {
            inputDisplayText.append(".")
            usedDecimal = true
        }
        inputDisplay.text = inputDisplayText + inputUnit
        inputNumber = Double(inputDisplayText)!
        
        conversion()
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag == 12 {
            clearCalculator()
        }
        
        if sender.tag == 13 && inputNumber != nil {
            negation()
            conversion()
        }
    }
    
    func clearCalculator() {
        inputDisplay.text = "" + inputUnit
        inputDisplayText = ""
        inputNumber = nil
        
        outputDisplay.text = "" + outputUnit
        outputDisplayText = ""
        outputNumber = nil
        
        usedDecimal = false
    }
    
    func conversion() {
        
        switch conversionCase{
        case 1: do{
            self.outputNumber = ((self.inputNumber! - 32) * 5/9)
            }
        case 2: do{
            self.outputNumber = ((self.inputNumber! * 9/5) + 32)
            }
        case 3: do {
            self.outputNumber = (0.621371 * self.inputNumber!)
            }
        case 4: do {
            self.outputNumber = (1.60934 * self.inputNumber!)
            }
        default: break
        }
        
        outputDisplayText = String(format: "%.2f", outputNumber!)
        
        outputDisplay.text = outputDisplayText + outputUnit
        
    }
    
    func negation() {
        if usedDecimal {
            inputNumber = (inputNumber! * -1)
            inputDisplayText = String(inputNumber!)
            inputDisplay.text = inputDisplayText + inputUnit
        } else {
            inputNumber = (inputNumber! * -1)
            inputDisplayText = String(Int(inputNumber!))
            inputDisplay.text = inputDisplayText + inputUnit
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
