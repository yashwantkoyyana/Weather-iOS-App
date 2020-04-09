//
//  WeatherRouterTests.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/27/20.
//  Copyright © 2020 YK. All rights reserved.
//

import XCTest
@testable import Weather
class WeatherRouterTests: XCTestCase {
    var mockNavigationController : MockNavigationController!
    var mod4 : WeatherRouter!
    override func setUp() {
        mockNavigationController = MockNavigationController()
        mod4 = WeatherRouter(navigationController: mockNavigationController)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        mod4 = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testgoToWeatherDetail(){
        
        mod4.goToDetailWeather(weatherDetails: WeatherModel(conditionId: 1, tempMin: 10, date: "today", tempMax: 20, pressure: 200, humidity: 200, id: 10, desc: "cloudy"))
        XCTAssertTrue(mockNavigationController.pushedViewController is DetailViewController )
        
    }
    
}









