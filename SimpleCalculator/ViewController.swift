//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by minjae on 22/01/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display_pannel: UILabel!
    
    private var is_number_in_pannel = false
    
    private var calculator_model: CalculatorModel = CalculatorModel()
    
    private var displayValue: Double {
        get {
            return Double(display_pannel.text!)!
        }
        set {
            display_pannel.text = String(newValue)
        }
    }
    
    @IBAction func touchNumber(sender: UIButton) {
        let number = sender.currentTitle!
        if is_number_in_pannel{
            display_pannel.text = display_pannel.text! + number
        }
        else {
            display_pannel.text = number
            is_number_in_pannel = true
        }
    }
    
    @IBAction func performOperator(sender: RoundButton) {
        if is_number_in_pannel {
            calculator_model.setOperand(operand: displayValue)
            is_number_in_pannel = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            calculator_model.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = calculator_model.result
    }
}

