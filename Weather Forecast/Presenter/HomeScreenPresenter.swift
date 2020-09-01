//
//  HomeScreenPresenter.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation


protocol HomeScreenPresentation : class {

    var view: HomeScreenView? { get }
    var router : HomeScreenWireframe! { get }
    var interactor : HomeScreenUseCase! { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisapper()
    func searchWeatherReportFor(city : String)
    func showAlert(title : String , message: String)
    
}

class HomeScreenPresenter: HomeScreenPresentation {
    
    weak var view: HomeScreenView?
    var router: HomeScreenWireframe!
    var interactor: HomeScreenUseCase!

           
    //1. clear data from DB which is last from 24hr
    
    func viewDidLoad() {
        self.interactor.deleteExpiredWeatherDataFromDB()
    }
    
    func viewWillAppear() { }
    
    func viewWillDisapper() { }
    
   
    func searchWeatherReportFor(city : String) {
        
        self.interactor.searchWeatherReportFor(city: city) { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                let viewModel = WeatherInfoViewModel(weatherInfoDBModel: weatherInfoDBModel)
                self.view?.updateUIWith(viewModel: viewModel)
                break
            case .failure(_):
                self.view?.hideDataView(isHideen: true)
                self.showAlert(title: "Error", message: "Error while fetching weather data . Please check the city name once and try again")
                break
            }
        }
    }
    
    func showAlert(title : String , message: String) {
        DispatchQueue.main.async {
            self.router.showAlert(title: title, message: message)
        }
    }
}
