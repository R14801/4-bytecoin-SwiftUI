//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Rajat Nagvenker on 8/20/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
    var src_side_base: [Src_Side_Base]
}

struct Src_Side_Base: Codable {
    var time: String
    var asset: String
    var rate: Double
    var volume: Double
}
