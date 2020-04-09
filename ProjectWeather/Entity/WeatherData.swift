//
//  WeatherData.swift
//  Clima
//
//  Created by Yash Koyyana on 03/09/2019.
//  Copyright © 2019 YK. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    var cnt: Int
    let city: City
    var list: [List]
    }

struct City: Decodable {
    
    var name: String
}

struct List: Decodable {
    
    var dt: Double
    var pressure: Float
    var humidity: Float
    var speed: Float
    var temp: TemperatureData
    var weather: [PicData]
}

struct TemperatureData: Decodable {
    var day: Float
    var min: Float
    var max: Float
    var night: Float
    var eve: Float
    var morn: Float
}

struct PicData: Decodable {
    var id: Int
    var description: String
}
