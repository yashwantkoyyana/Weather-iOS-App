//
//  MockWeatherRouter.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/24/20.
//  Copyright © 2020 YK. All rights reserved.
//
@testable import Weather
import Foundation

class MockWeatherRouter : WeatherRoutable{
    var changeScreen : Bool = false
    func goToDetailWeather(weatherDetails: WeatherModel) {
        changeScreen = true
    }
    
}
