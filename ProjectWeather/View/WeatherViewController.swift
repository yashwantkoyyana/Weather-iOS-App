//
//  ViewController.swift
//  Clima
//
//  Created by Yash Koyyana on 01/09/2019.
//  Copyright © 2019 YK. All rights reserved.
//
// swiftlint:disable force_cast

import UIKit
import CoreLocation

protocol WeatherViewable: AnyObject {
        func updateWeatherUI( weather: Forecast)
}

class WeatherViewController: UIViewController {
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var searchTextField: UITextField!
    var presenter: WeatherPresentable?
    @IBOutlet private weak var tableView: UITableView!
    let locationManager = CLLocationManager()
    var indexOfData: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        searchTextField.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
extension WeatherViewController: WeatherViewable {
    
    func updateWeatherUI(weather: Forecast) {
        let tempVar = (weather.arrweathermodels[0].tempMax + weather.arrweathermodels[0].tempMin) / 2
        self.temperatureLabel.text = String(format: "%.1f", tempVar)
        self.conditionImageView.image = UIImage(systemName: weather.arrweathermodels[0].conditionName)
        self.cityLabel.text = weather.cityName
        //self.tableDatatoLoad = weather.arrweathermodels
        self.tableView.isHidden = false
        self.tableView.reloadData()
    }
}
// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction private func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        if !text.isEmpty {
            return true
        }
        else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            
            presenter?.cityTextFieldFinishEditing(cityName: city)
        }
        
        searchTextField.text = ""
    }
}

// MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction private func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            presenter?.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

// MARK: - TableViewDelegate, TableViewDataSource
extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let noOfRows = (presenter?.numberOfRows()) else { return 0 }
        return noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        guard let tableData = presenter?.presentTableDataToLoad(indexPath.row) else { return mycell }
        mycell.initWithModel(weatherData: tableData)
        return mycell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexOfData = indexPath.row
        presenter?.tableRowPressed(indexOfData)
    }
}
