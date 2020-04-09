//
//  MockWeatherInteractor.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/23/20.
//  Copyright © 2020 YK. All rights reserved.
//
@testable import Weather
import Foundation
import UIKit



//protocol NetworkTask {
//    func resume()
//}
//
//extension URLSessionDataTask : NetworkTask
//{
//}
//
//protocol NetworkSession {
//
//     func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask
//
//     func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask
//
//}
//extension URLSession : NetworkSession {
//    func dataTask(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask{
//
//        return dataTask(with: request, completionHandler: completion)
//    }
//
//    func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask{
//
//        return dataTask(with: url, completionHandler: completion)
//    }
//
//
//}
import CoreLocation
class MockWeatherInteractor : WeatherInteractable{
    var mockModel : Forecast = Forecast(arrweathermodels: [
        WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy"),
        WeatherModel(conditionId: 300, tempMin: 10, date: "tomorrow", tempMax: 25, pressure: 1004, humidity: 108, id: 500, desc: "sunny"),
        WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy")],
        cityName: "Atlanta")
    
    
    func fetchWeather(cityName: String, completion: @escaping (Forecast?) -> Void) {
        performRequest(with: "testurl") { (forecast) in
            completion(forecast)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping (Forecast?) -> Void) {
        completion(mockModel)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (Forecast?) -> Void) {
        performRequest(with: "testurl") { (forecast) in
            completion(forecast)
        }
    }
    
    
    
}
