//
//  CoinData.swift
//  ByteCoin
//
//  Created by Rajat Nagvenker on 8/20/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData {
    var currency: String
    var rate: Double
    var formattedRate: String{
        return String(format: "%.2f", rate)
    }
}
