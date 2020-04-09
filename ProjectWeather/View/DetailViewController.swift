//
//  DetailViewController.swift
//  Clima
//
//  Created by Yash Koyyana on 1/9/20.
//  Copyright © 2020 YK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var humidityLabel: UILabel!
    
    @IBOutlet private weak var pressureLabel: UILabel!
    
    @IBOutlet private weak var descLabel: UILabel!
    var humitidyText: String = ""
    var pressureText: String = ""
    var descText: String = ""
    
    func initWithModel(weatherDetails: WeatherModel) {
        
        self.humitidyText = String(Int(weatherDetails.humidity))
        self.pressureText = String(Int(weatherDetails.pressure))
        self.descText = weatherDetails.desc
    }
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        humidityLabel.text = humitidyText
        pressureLabel.text = pressureText
        descLabel.text = descText
        }
}
