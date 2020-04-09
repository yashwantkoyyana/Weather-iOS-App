//
//  WeatherViewControllerTests.swift
//  ClimaTests
//
//  Created by Yash Koyyana on 1/24/20.
//  Copyright © 2020 YK. All rights reserved.
//
// swiftlint:disable force_cast
import XCTest
@testable import Weather
import CoreLocation
import Foundation
class WeatherViewControllerTests: XCTestCase {
    var  mod3: WeatherViewController!
    var presenter: MockWeatherPresenter!
    let locationManager = CLLocationManager()
    var tableView: UITableView!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mod3 = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController)
        presenter = MockWeatherPresenter(view: mod3, router: WeatherRouter(navigationController: UINavigationController()), interactor: WeatherInteractor())
    
        mod3.presenter = presenter
        mod3.beginAppearanceTransition(true, animated: false)

        mod3.endAppearanceTransition()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mod3 = nil
        presenter = nil
    }

    func testupdateWeatherUI(){
       // mod3.viewDidLoad()

        mod3.updateWeatherUI(weather: Forecast(arrweathermodels: [WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy"),WeatherModel(conditionId: 300, tempMin: 10, date: "tomorrow", tempMax: 25, pressure: 1004, humidity: 108, id: 500, desc: "sunny"),WeatherModel(conditionId: 200, tempMin: 10, date: "today", tempMax: 20, pressure: 1002, humidity: 105, id: 200, desc: "rainy")], cityName: "Atlanta"))
        XCTAssertEqual(mod3.cityLabel.text,"Atlanta")
    }

    func testviewDidLoad(){
        
        
        XCTAssertNotNil(mod3.locationManager.delegate)
        XCTAssertNotNil(mod3.searchTextField.delegate)
        
        
        
    }
    
    func testsearchPressed(){
        
        mod3.searchTextField.text="Atlanta"
        mod3.searchPressed(UIButton())
        _ = mod3.textFieldShouldReturn(mod3.searchTextField)
        _ = mod3.textFieldShouldEndEditing(mod3.searchTextField)
        mod3.textFieldDidEndEditing(mod3.searchTextField)
        XCTAssertTrue(presenter.finishEditing)
    }
    func testlocationPressed(){
        mod3.locationPressed(UIButton())
        
        
    }
    
   
}
