//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculateBrain = CalculateBrain()
    
    var tip = 0.10
    var numberOfPeople = 0
    
    var tipPct: Int?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Deselecte all tip buttons via IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Make the button that triggered the IBAction selected.
        sender.isSelected = true
        
        // Get the current title of button that was pressed.
        guard let buttonTitle = sender.currentTitle else {
            fatalError("Can't get current title of button that was pressed.")
        }
        
        // Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleRemovePercentSign = String(buttonTitle.dropLast())
        
        // Turn the String into a Double.
        guard let converToDouble = Double(buttonTitleRemovePercentSign) else {
            fatalError("Can't turn the 'buttonTitleRemovePercentSign' into a Double.")
        }
        
        // Divide the present expressed out of 100 into a decimal
            // e.g 10 becomes 0.1
        tip = converToDouble / 100
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = calculateBrain.convertDoubleToString(sender.value)
        
        // Set the numberOfPeople property as the value of the stepper as hole number.
        numberOfPeople = calculateBrain.getNumberOfPerson(sender.value)
//        print(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = calculateBrain.getText(billTextField.text)
        
        let doubleTypeOfBillText = calculateBrain.convertStringToDouble(billText)
        
        let totalPeople = calculateBrain.convertIntToDouble(numberOfPeople)
        
        let tipCalculateResult = calculateBrain.getTipCalculateResult(billTotalValue: doubleTypeOfBillText, tipValue: tip, numberOfPeople: totalPeople)
        print(tip)
        calculateBrain.calculateResult(billTotalValue: doubleTypeOfBillText, tipValue: tip, numberOfPeople: totalPeople, totalPerPerson: tipCalculateResult)
        

        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            guard let destinationVC = segue.destination as? ResultsViewController else {
                fatalError("Error: ResultViewController casting error.")
            }
            
            destinationVC.totalText = calculateBrain.getTotalText()
            destinationVC.settingText = calculateBrain.getSettingLabelText()
        }
    }
    
    
 
}
