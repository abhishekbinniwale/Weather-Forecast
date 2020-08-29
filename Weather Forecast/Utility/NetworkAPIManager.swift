//
//  NetworkAPIManager.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 30/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

final class NetworkAPIManager {
    
    static let sharedInstance = NetworkAPIManager()
    
    let API_KEY = "849dd394869af34b3cdc5c6c7dd316a0"
    func fetchWeatherDataFor(city : String) {
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)"
        if let url = URL(string: urlString){
            let datatask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error while fetching data for city :\(city)")
                }
                if let weatherData = data {
                    
                }
            }
            datatask.resume()
        }
    }
    
}
