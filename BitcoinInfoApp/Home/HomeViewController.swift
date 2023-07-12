//
//  HomeViewController.swift
//  BitcoinInfoApp
//
//  Created by kingSemih on 12.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var coinValueImage: UIImageView!
    @IBOutlet weak var marcetDominanceLabel: UILabel!
    @IBOutlet weak var totalHoldingLabel: UILabel!
    @IBOutlet weak var totalUSDLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let exaCoin = CurrentCoin(totalHolding: 10.2, totalUSDValue: 1234.6, marcetCapDominance: 0.7)
//        let coinModel = ModelOfCoin(data: exaCoin)
//        assingCoinModel(coinModel: coinModel)
        
        let baseURL = URL(string: "https://api.coingecko.com/api/v3/")
        let requestURL = URL(string: "companies/public_treasury/bitcoin",relativeTo: baseURL)
        let coinData = try! Data(contentsOf: requestURL!)
        let jsonData = try! JSONSerialization.jsonObject(with: coinData,options: [])
        print("JSON DATA \(jsonData)")
    }
    
    
    func assingCoinModel(coinModel:ModelOfCoin){
        totalHoldingLabel.text = String(coinModel.totalHolding)
        totalUSDLabel.text = String(coinModel.totalUSDValue)
        marcetDominanceLabel.text = String(coinModel.marcetCapDominance)
        if let dummyImage = UIImage(systemName: coinModel.marcetCapDominance < 1.0 ? "arrow.down" : "arrow.up" ){
            coinValueImage.image = dummyImage
        }
    }
    
    @IBAction func refreshButtonAction(_ sender: UIButton) {
    }
}
