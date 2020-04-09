//
//  WeatherInteractor.swift
//  Clima
//
//  Created by Yash Koyyana on 1/14/20.
//  Copyright © 2020 YK. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherInteractable: AnyObject {
    func fetchWeather(cityName: String, completion: @escaping(_ forecastModal: Forecast?) -> Void )
    func performRequest(with urlString: String, completion: @escaping(_ forecastModal: Forecast?) -> Void)
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping(_ forecastModal: Forecast?) -> Void )
}

class WeatherInteractor: WeatherInteractable {
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast/daily?"
    
    var presenter: WeatherPresentable?
    
    func fetchWeather(cityName: String, completion: @escaping(_ forecastModal: Forecast?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(cityName)&cnt=7&appid=e72ca729af228beabd5d20e3b7749713&units=metric"
        performRequest(with: urlString) { foreCastModel in
            completion(foreCastModel)
        }
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping(_ forecastModal: Forecast?) -> Void ) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)&cnt=7&appid=e72ca729af228beabd5d20e3b7749713&units=metric"
        performRequest(with: urlString) { foreCastModal in
            completion(foreCastModal)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping(_ forecastModal: Forecast?) -> Void) {
           if let url = URL(string: urlString) {
               let session = URLSession(configuration: .default)
            
               let task = session.dataTask(with: url) { data, _, error in
                   if error != nil {
                    self.presenter?.didFailWithError(error: error)
                    return
                   }
                   if let safeData = data {
                       if let forecast = self.parseJSON(safeData) {
                        completion(forecast)
                       }
                   }
               }
               task.resume()
           }
        }
    
    func parseJSON(_ weatherData: Data) -> Forecast? {
         let decoder = JSONDecoder()
         do {
             let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
             var arrofWeather: [WeatherModel] = []
             let city = decodedData.city.name
             let dateFormatter = DateFormatter()
             
             for item in decodedData.list {
                 
                 let date = item.dt
                 let tempMin = item.temp.min
                 let tempMax = item.temp.max
                 let pressure = item.pressure
                 let humidity = item.humidity
                 let id = item.weather[0].id
                 let desc = item.weather[0].description
                 let currentDate = Date(timeIntervalSince1970: date)
                 let dateString = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: currentDate) - 1]
                 
                 let weather = WeatherModel(conditionId: id, tempMin: tempMin, date: dateString, tempMax: tempMax, pressure: pressure, humidity: humidity, id: id, desc: desc)
                 
                 arrofWeather.append(weather)
             }
             return Forecast(arrweathermodels: arrofWeather, cityName: city)
         }
         catch {
             presenter?.didFailWithError(error: error)
             return nil
         }
     }
}
