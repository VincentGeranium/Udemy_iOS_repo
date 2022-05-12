//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let heightValue = sender.value
        let roundUpStr = String(format: "%.2f", heightValue)
        
        heightLabel.text = "\(roundUpStr)m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weightValue = sender.value
        let roundUpStr = String(format: "%.0f", weightValue)
        
        weightLabel.text = "\(roundUpStr)kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        // weight / (height * height) == weight / pow(height, 2) 같은 공식
        // pow(제곱해질 값, 제곱할 값) -> 예를 들어 2³을 하고 싶을 경우 pow(2, 3)
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()

        }
    }
}

