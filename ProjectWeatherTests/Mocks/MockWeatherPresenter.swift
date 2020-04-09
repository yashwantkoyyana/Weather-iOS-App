//
//  MockWeatherPresenter.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/22/20.
//  Copyright © 2020 YK. All rights reserved.
//

import Foundation
@testable import Weather
import CoreLocation

class MockWeatherPresenter{
    
    var interactor : WeatherInteractable
    var router : WeatherRoutable
    var view : WeatherViewable
    var finishEditing: Bool = false
    
    init(view: WeatherViewable, router: WeatherRoutable, interactor: WeatherInteractable) {
        
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }

    
}

extension MockWeatherPresenter : WeatherPresentable{
    
    func cityTextFieldFinishEditing(cityName: String) {
         finishEditing = true
     }
     
     func didFailWithError(error: Error) {
         
     }           
     
     func didUpdateWeather(weather: Forecast) {
         
     }
     
     func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
         
     }
     
     func presentTableDataToLoad(_: Int) -> WeatherModel {
         return WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 200, humidity: 300, id: 200, desc: "rainy")
     }
     
     func numberOfRows() -> Int {
         return 1
     }
     
     func tableRowPressed(_: Int) {
         
     }
    
}
