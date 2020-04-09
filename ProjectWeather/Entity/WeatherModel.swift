//
//  WeatherModel.swift
//  Clima
//
//  Created by Yash Koyyana on 03/09/2019.
//  Copyright © 2019 YK. All rights reserved.
//

import Foundation

struct Forecast {
    var arrweathermodels = [WeatherModel]()
    var cityName: String
    }

struct WeatherModel: Equatable {
    let conditionId: Int
    let tempMin: Float
    let date: String
    let tempMax: Float
    let pressure: Float
    let humidity: Float
    let id: Int
    let desc: String
    
    var conditionName: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
