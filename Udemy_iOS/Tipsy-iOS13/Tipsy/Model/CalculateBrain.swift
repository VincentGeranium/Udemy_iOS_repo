//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Kwangjun Kim on 2022/05/13.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    var result: Result?
    
    func convertDoubleToString(_ value: Double) -> String {
        return String(format: "%.0f", value)
    }
    
    func getNumberOfPerson(_ value: Double) -> Int {
        return Int(value)
    }
    
    func getText(_ value: String?) -> String {
        if let value = value {
            return String(value)
        } else {
            return String("Error: Can't get Textfield text...")
        }
    }
    
    func convertStringToDouble(_ value: String) -> Double {
        if Double(value) != nil {
            return Double(value) ?? 0.0
        } else {
            fatalError("Can't convert Double type.")
        }
    }
    
    func getTipCalculateResult(billTotalValue: Double, tipValue: Double, numberOfPeople: Double) -> Double {
        return (billTotalValue + (billTotalValue * tipValue)) / numberOfPeople
    }
    
    func convertIntToDouble(_ value: Int) -> Double {
        return Double(value)
    }
    
    mutating func calculateResult(billTotalValue: Double, tipValue: Double, numberOfPeople: Double, totalPerPerson: Double) {
        let totalPerPerson = totalPerPerson
        let totalPerPersonStr = String(format: "%.2f", totalPerPerson)
        let numberOfPeopleStr = String(format: "%.0f", numberOfPeople)
        let tipValue = tipValue * 100
        let tipValueStr = String(format: "%.0f", tipValue)
        
        result = Result(totalLabelText: totalPerPersonStr,
                        settingLabelText: "Split between \(numberOfPeopleStr) people, with \(tipValueStr)% tip.")
    }
    
    func getTotalText() -> String {
        if let returnTotalText = result?.totalLabelText {
            return returnTotalText
        } else {
            fatalError("result.totalLabelText is nil")
        }
    }
    
    func getSettingLabelText() -> String {
        if let returnSettiingLabelText = result?.settingLabelText {
            return returnSettiingLabelText
        } else {
            fatalError("result.settingLabelText is nil")
        }
    }
}
