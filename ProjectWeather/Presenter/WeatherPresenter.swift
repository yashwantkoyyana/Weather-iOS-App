//
//  WeatherPresenter.swift
//  Clima
//
//  Created by Yash Koyyana on 1/14/20.
//  Copyright © 2020 YK. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherPresentable: AnyObject {
    func cityTextFieldFinishEditing(cityName: String)
    func didFailWithError(error: Error?)
    func didUpdateWeather(weather: Forecast)
    func fetchWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    func presentTableDataToLoad(_ : Int) -> WeatherModel
    func numberOfRows() -> Int
    func tableRowPressed(_ : Int)
}

class WeatherPresenter: WeatherPresentable {
    var tableDatatoLoad = [WeatherModel]()
    var interactor: WeatherInteractable
    var router: WeatherRoutable
    weak var view: WeatherViewable?
    
    init(view: WeatherViewable, router: WeatherRoutable, interactor: WeatherInteractable) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func presentTableDataToLoad(_ index: Int) -> WeatherModel {
        return tableDatatoLoad[index]
    }
    
    func numberOfRows() -> Int {
        return tableDatatoLoad.count
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        interactor.fetchWeather(latitude: latitude, longitude: longitude) { foreCast in
            if let foreCast = foreCast {
                self.didUpdateWeather(weather: foreCast)
            }
        }
    }
    
    func cityTextFieldFinishEditing(cityName: String) {
        interactor.fetchWeather(cityName: cityName) { foreCast in
            if let foreCast = foreCast {
                self.didUpdateWeather(weather: foreCast)
            }
        }
    }
    
    func didFailWithError(error: Error?) {
        guard let error = error else { return }
        print(error)
    }
    
    func didUpdateWeather(weather: Forecast) {
        tableDatatoLoad = weather.arrweathermodels
        DispatchQueue.main.async {
            self.view?.updateWeatherUI(weather: weather)
        }
    }
    func tableRowPressed(_ index: Int) {
        router.goToDetailWeather(weatherDetails: tableDatatoLoad[index])
    }
}
