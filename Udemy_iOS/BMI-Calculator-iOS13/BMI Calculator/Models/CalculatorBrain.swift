//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Kwangjun Kim on 2022/05/12.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

// MARK: - way 2 강의
struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let convertToStringBMI = String(format: "%.1f", bmi?.value ?? 0.0)
        
        return convertToStringBMI
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
  
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more food !", color: UIColor.systemCyan)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle !", color: UIColor.systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "More workout and eat clean food !", color: UIColor.systemPink)
        }
    }
    
    func getAdvice() -> String {
        if let returnAdvice = bmi?.advice {
            return returnAdvice
        } else {
            print("Can't get BMI Model's advice value.")
            
            return "Notting to say."
        }
    }
    
    func getColor() -> UIColor {
        if let returnColor = bmi?.color {
            return returnColor
        } else {
            print("Can't get BMI Model's color value.")
            
            return UIColor.white
        }
    }
}

// MARK: - way 1 내 방식
//struct CalculatorBrain {
//    var bmiValue: Float?
//
//    mutating func calculateBMI(height: Float, weight: Float) -> Float {
//
//        self.bmiValue = weight / pow(height, 2)
//
//        return bmiValue!
//    }
//
//    mutating func getBMIValue() -> String {
//
//        return String(format: "%.1f", self.bmiValue!)
//    }
//}
