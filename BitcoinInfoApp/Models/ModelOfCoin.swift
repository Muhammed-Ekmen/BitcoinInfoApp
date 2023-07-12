//
//  ModelOfCoin.swift
//  BitcoinInfoApp
//
//  Created by kingSemih on 12.07.2023.
//

import Foundation


struct ModelOfCoin{
    let totalHolding:Double
    let totalUSDValue:Double
    let marcetCapDominance:Double
    
    
    init(data:CurrentCoin) {
        self.totalHolding = data.totalHolding
        self.totalUSDValue = data.totalUSDValue
        self.marcetCapDominance = data.marcetCapDominance
    }
}
