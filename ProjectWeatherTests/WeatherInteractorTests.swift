//
//  WeatherInteractorTests.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/23/20.
//  Copyright © 2020 YK. All rights reserved.
//

import XCTest
@testable import ProjectWeather

class WeatherInteractorTests: XCTestCase {
    var mod2 : WeatherInteractor!
    
    override func setUp() {
        
        mod2 = WeatherInteractor()
    }
    
    override func tearDown() {
        mod2 = nil
    }
    
    func testfetchWeather(){
        let expect = expectation(description: "Get weather modal")
        mod2.fetchWeather(cityName: "Atlanta") { (weatherModel) in
            expect.fulfill()
            XCTAssertNotNil(weatherModel)
          }
        waitForExpectations(timeout: 2.0, handler: nil)
        
    }
    
    func testfetchWeatherWithLatLong(){
        let expect = expectation(description: "Get weather modal")
        mod2.fetchWeather(latitude: 50, longitude: 50) {(weatherModel) in
            expect.fulfill()
            XCTAssertNotNil(weatherModel)
        }
        waitForExpectations(timeout: 2.0, handler: nil)

        
    }
    
    func testdidFailWithError(){
        
        
        
    }
    
}
