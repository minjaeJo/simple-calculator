//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by minjae on 22/01/2019.
//  Copyright © 2019 minjae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var is_number_in_pannel = false
    @IBOutlet weak var display_pannel: UILabel!
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
    @IBAction func performOperator(_ sender: Any) {
        
    }
}

