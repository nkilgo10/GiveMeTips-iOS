//
//  ViewController.swift
//  GiveMeTips-iOS
//
//  Created by ibg training 5 on 12/10/20.
//  Copyright © 2020 ibg training 5. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = "0"
    var billTotal = 0.0
    
    var overallTotal = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
        
        let buttonTitle = sender.currentTitle!
        let buttonWOPercent = String(buttonTitle.dropLast())
        let titleAsNumber = Double(buttonWOPercent)!
        
        tip = titleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let numberText = String(format: "%.0f", sender.value)
        splitNumberLabel.text = numberText
        numberOfPeople = numberText
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let total = billTotal * (1 + tip) / Double(numberOfPeople)!
            let roundedTotal = String(format: "%.2f", total)
            
            overallTotal = roundedTotal
            tip = (tip * 100)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.total = overallTotal
            resultVC.settings = "Split between \(numberOfPeople) people, with \(tip)% tip."
        }
    }
}

