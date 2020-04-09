//
//  WeatherTableViewCell.swift
//  Clima
//
//  Created by Yash Koyyana on 1/8/20.
//  Copyright © 2020 YK. All rights reserved.
//

import Foundation

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dayName: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var picDisp: UIImageView!
    
    func initWithModel(weatherData: WeatherModel) {
        maxTempLabel.text = String(weatherData.tempMax)
        minTempLabel.text = String(weatherData.tempMin)
        dayName.text = String(weatherData.date)
        backgroundColor = UIColor.clear
        picDisp.image = UIImage(systemName: weatherData.conditionName)
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
 }
