//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFetchData(coinData: CoinData)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "0FECB23C-788B-4DC9-89F1-62266882C1B8"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String){
        
        if let url = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data,response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(data: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(CoinModel.self, from: data)
            let coinData = CoinData(currency: decodedData.asset_id_quote, rate: decodedData.src_side_base[0].rate)
            delegate?.didFetchData(coinData: coinData)
        } catch {
            print(error)
        }
    }
    
}
