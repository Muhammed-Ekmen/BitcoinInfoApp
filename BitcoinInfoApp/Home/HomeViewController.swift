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

        let baseURL = URL(string: "https://api.coingecko.com/api/v3/")
        let requestURL = URL(string: "companies/public_treasury/bitcoin",relativeTo: baseURL)
        
        
//        // NOT ASYNC PROCESS
//        let coinData = try! Data(contentsOf: requestURL!)
//        let jsonData = try! JSONSerialization.jsonObject(with: coinData,options: [])
////      Thread.sleep(until: 5) // Delayin 5 seconds
//        print("JSON DATA \(jsonData)")
//
        
//        ASYNC PROCESS
        let request = URLRequest(url: requestURL!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) {
            data , response , error in
            let jsonData = try! JSONSerialization.jsonObject(with: data!,options:[])
            print("JSONDATA:\(jsonData)")
        }
        task.resume()
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
