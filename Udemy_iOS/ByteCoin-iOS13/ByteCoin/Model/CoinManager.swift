//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdatePrice(price: String, currency: String)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "226165B5-FE31-40B2-B3C3-9F33CE2F37B0"
    let headerField = "X-CoinAPI-Key"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        performRequest(with: currency)
    }
    
    
    func performRequest(with currency: String) {
        let baseURL = "\(baseURL)/\(currency)?apiKey=\(apiKey)"
        
        if let safeURL = URL(string: baseURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: safeURL) { data, response, error in
                
                if error != nil {
                    guard let error = error else {
                        return
                    }
                    delegate?.didFailWithError(error: error)
                }
                
                if let safaData = data {
                    if let price = parseJSON(safaData) {
                        let priceString = String(format: "%.2f", price)
                        delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Double? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    

    
}
