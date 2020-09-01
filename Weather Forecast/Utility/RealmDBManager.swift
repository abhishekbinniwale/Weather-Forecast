//
//  RealmDBManager.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 30/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmDBManager {
    
    static let sharedInstance = RealmDBManager()
    
    private init() {}
    
    func fetchWeatherInfoFromDBFor(city : String, completion: @escaping (Result<WeatherInfoDBModel, WeatherInfoFetchingError>)->()) {
        print("RealmDB file path :\(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        do {
            let realm = try Realm()
            if let result = realm.objects(WeatherInfoDBModel.self).filter({ $0.cityName.lowercased() == city.lowercased() }).first {
                completion(.success(result))
            }else {
                completion(.failure(.notFound))
            }
        }catch let error {
            print("Error while fetching weatherInfo:\(error)")
            completion(.failure(.notFound))
        }
    }
    
    func saveWeatherInfoInDB(weatherInfo : WeatherInfoModel) {
        let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfo)
        
       do {
           let realm = try Realm()
           try realm.write{
               realm.add(weatherInfoDBModel)
           }
       } catch let error {
           print("Error while saving realm object :\(error)")
       }
    }
    
    func deleteWeatherInfoAfterOneDay(){
        do {
            let realm = try Realm()
            let results = realm.objects(WeatherInfoDBModel.self).filter({ $0.weatherInfoFetchTime?.hoursCompletedFromSaved() == false })
            //Delte info from DB
             try realm.write{
                realm.delete(results)
            }
        }catch let error {
            print("Error while fetching weatherInfo:\(error)")
        }
    }
}

extension Date {
    
    func hoursCompletedFromSaved()-> Bool {
        let currentDate = Date()
        if let timeInterval: TimeInterval = currentDate.timeIntervalSince(self) {
            let hoursBetweenDates = (timeInterval / 3600)
            return hoursBetweenDates.isLess(than: 24.0)
        }
         return false
    }
    
}
