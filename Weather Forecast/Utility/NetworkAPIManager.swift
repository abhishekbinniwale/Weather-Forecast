//
//  NetworkAPIManager.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 30/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

enum WeatherInfoFetchingError: Error {
    case timeout
    case unknown
    case notFound
    case parsingFailure
}

final class NetworkAPIManager {
    
    static let sharedInstance = NetworkAPIManager()
    let API_KEY = "849dd394869af34b3cdc5c6c7dd316a0"
    
    func fetchWeatherDataFor(city : String, completion: @escaping (Result<WeatherInfoModel, WeatherInfoFetchingError>)->()) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)"
        if let url = URL(string: urlString){
            let datatask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error while fetching data for city :\(city)")
                    completion(.failure(.notFound))
                }
                if let httpResponse = response as? HTTPURLResponse {
                    print("API response :\(httpResponse)")
                    if  httpResponse.statusCode >= 400 && httpResponse.statusCode < 500 {
                        completion(.failure(.notFound))
                    }
                }
                if let weatherData = data {
                    do {
                        let weatherInfoModel = try JSONDecoder().decode(WeatherInfoModel.self, from: weatherData)
                        print("weather info model :\(weatherInfoModel)")
                        completion(.success(weatherInfoModel))
                    } catch let error {
                        print("error while decoding json :\(error)")
                        completion(.failure(.parsingFailure))
                    }
                }
            }
            datatask.resume()
        }
    }
}
