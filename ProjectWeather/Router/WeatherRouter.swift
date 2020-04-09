//
//  WeatherRouter.swift
//  Clima
//
//  Created by Yash Koyyana on 1/14/20.
//  Copyright © 2020 YK. All rights reserved.
//
// swiftlint:disable force_cast
import UIKit

protocol WeatherRoutable {
    func goToDetailWeather(weatherDetails: WeatherModel)
    }
class WeatherRouter {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {

        self.navigationController = navigationController
    }
       
    static func createModule(using navigationController: UINavigationController) -> WeatherViewController {
        
        // Create layers
        let router = WeatherRouter(navigationController: navigationController)
        
        let interactor = WeatherInteractor()
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let presenter = WeatherPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        return view
    }
}
extension WeatherRouter: WeatherRoutable {
    func goToDetailWeather(weatherDetails: WeatherModel) {
        
        if let viewController: DetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            viewController.initWithModel(weatherDetails: weatherDetails)
            
            self.navigationController.present(viewController, animated: true, completion: nil)
        }
    }
}
