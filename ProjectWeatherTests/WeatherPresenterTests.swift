//
//  ClimaTests.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/22/20.
//  Copyright © 2020 YK. All rights reserved.
//

import XCTest
@testable import Weather
class WeatherPresenterTests: XCTestCase {
    //var presenter: WeatherPresenter!
    
    var mockWeatherInteractor: MockWeatherInteractor!
    var mockWeatherViewController : MockWeatherViewController!
    var mockWeatherRouter : MockWeatherRouter!
    //var mockView: MockWeatherViewController!
    var mod1 : WeatherPresenter!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockWeatherInteractor = MockWeatherInteractor()
        mockWeatherRouter = MockWeatherRouter()

        mockWeatherViewController = MockWeatherViewController()
        mod1 = WeatherPresenter(view: mockWeatherViewController, router: mockWeatherRouter, interactor: mockWeatherInteractor)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mod1 = nil
        mockWeatherInteractor = nil
        mockWeatherViewController = nil
    }
    
    
    func testnoOfRows(){
        mod1.tableDatatoLoad=[WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy"),WeatherModel(conditionId: 300, tempMin: 10, date: "tomorrow", tempMax: 25, pressure: 1004, humidity: 108, id: 500, desc: "sunny"),WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy")]
        let result = mod1.numberOfRows()
        XCTAssertEqual(result, 3)
    }
    
    func testpresentTableDataToLoad(){
        
        mod1.tableDatatoLoad=[WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy"),WeatherModel(conditionId: 300, tempMin: 10, date: "tomorrow", tempMax: 25, pressure: 1004, humidity: 108, id: 500, desc: "sunny"),WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy")]
        let result = mod1.presentTableDataToLoad(0)
        let testres = WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy")
        XCTAssertEqual(result, testres)
        
        
    }
    func testfetchWeather(){
        mod1.fetchWeather(latitude: 100, longitude: 100)
        var count = mod1.tableDatatoLoad.count
        XCTAssertEqual(count, 3)
        
    }
    func testcityTextFieldFinishedEditing(){
        mod1.cityTextFieldFinishEditing(cityName: "Atlanta")
        var count = mod1.tableDatatoLoad.count
        XCTAssertEqual(count, 3)
        
    }
    func testtableRowPressed(){
        mod1.tableDatatoLoad=[WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy"),WeatherModel(conditionId: 300, tempMin: 10, date: "tomorrow", tempMax: 25, pressure: 1004, humidity: 108, id: 500, desc: "sunny"),WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy")]
        mod1.tableRowPressed(1)
        XCTAssertTrue(mockWeatherRouter.changeScreen)
        
        
    }
  
}
