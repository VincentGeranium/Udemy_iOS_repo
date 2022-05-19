//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    // MARK: - Model
    var coinManager = CoinManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }


}

extension ViewController: CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String) {
        
        DispatchQueue.main.async {
            self.bitcoinLabel.text = currency
            self.currencyLabel.text = price
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}


// MARK: - Extension for UIPickerViewDataSource and UIPickerViewDelegate.
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - UIPickerViewDelegate Methods
    /// This method expects a String as an output. The String is the title for a given row. When the PickerView is loading up, it will ask its delegate for a row title and call the above the method once for every row. So when it is trying to  get the title for the first row, it will pass in a row value of 0 and a component.(column) value of 0.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let currency = coinManager.currencyArray[row]
        coinManager.performRequest(with: currency)
        
        
        return coinManager.currencyArray[row]
    }
    
    /// This will get called every time when the user scrolls the picker. When that happens it will record the row number that was selected.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
    // MARK: - UIPickerViewDataSource Methods
    /// Determine how many columns want in this app picker.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// How many rows this picker should have using this method.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
}
