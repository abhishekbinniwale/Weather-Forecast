//
//  HomeScreenInteractor.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
//(Result<UIImage, ImageFetchingError>) -> Void
protocol HomeScreenUseCase {
    
    func searchWeatherReportFor(city : String, completion: @escaping (Result<WeatherInfoDBModel, WeatherInfoFetchingError>)->())
    func deleteExpiredWeatherDataFromDB()
    func saveNewSearchedWeatherDataToDB(model : WeatherInfoModel)
}

class HomeScreenInteractor: HomeScreenUseCase {
    
    
    //1. First search is that city weather info is already saved in DB
    //2. If not found in DB then fetch from server
    //3. After fetching from Server save in DB for 24hr
    
    func searchWeatherReportFor(city : String, completion: @escaping (Result<WeatherInfoDBModel, WeatherInfoFetchingError>)->()) {
        
        RealmDBManager.sharedInstance.fetchWeatherInfoFromDBFor(city: city) { (result) in
            
            switch result {
            case let .success(weatherInfoDBModel) :
                completion(.success(weatherInfoDBModel))
                break
            case .failure(_):
                NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: city) { (result) in
                    switch result {
                    case let .success(model) :
                        let weatherInfoDBModel = WeatherInfoDBModel(model: model)
                        self.saveNewSearchedWeatherDataToDB(model: model)
                        completion(.success(weatherInfoDBModel))
                        break
                    case let .failure(error):
                        completion(.failure(error))
                        break
                    }
                }
                break
            }
        }
    }
    
    //Delete expired weather data from DB
    func deleteExpiredWeatherDataFromDB(){
        print("Delete exired data from DB")
        RealmDBManager.sharedInstance.deleteWeatherInfoAfterOneDay()
    }
    
    //After fetching from Server save in DB for 24hr
    func saveNewSearchedWeatherDataToDB(model : WeatherInfoModel){
        RealmDBManager.sharedInstance.saveWeatherInfoInDB(weatherInfo: model)
    }
}
