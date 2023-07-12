//
//  CurrentCoin.swift
//  BitcoinInfoApp
//
//  Created by kingSemih on 12.07.2023.
//

import Foundation


struct CurrentCoin{
    let totalHolding:Double
    let totalUSDValue:Double
    let marcetCapDominance:Double
    
    init(totalHolding: Double, totalUSDValue: Double, marcetCapDominance: Double) {
        self.totalHolding = totalHolding
        self.totalUSDValue = totalUSDValue
        self.marcetCapDominance = marcetCapDominance
    }
}
