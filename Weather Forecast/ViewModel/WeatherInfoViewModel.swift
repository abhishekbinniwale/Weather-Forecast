//
//  WeatherInfoViewModel.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 31/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

enum weatherCondition : String {
    case Drizzle
    case Rain
    case Haze
    case Clouds
    
    
    func getImageName()->String {
        switch self {
        case .Drizzle: return "light_rain"
        case .Rain: return "heavy_rain"
        case .Haze: return "clear_cloud"
        case .Clouds: return "partly_cloudy_day"
        }
    }
}


class WeatherInfoViewModel {
    
    var weatherMain : String?
    var weatherDescription : String?
    var cityName : String?
    var visibility : String?
    var windSpeed :String?
    var degree : Int = 0
    var currentTemperature : String?
    var feelsLike : Float = 0.0
    var minimumTemperature : String?
    var maximumTemperature : String?
    var pressure : Int = 0
    var humidity : String?
    var isWishListed : Bool = false
    var imageName : String
    
    init(weatherInfoDBModel : WeatherInfoDBModel) {
        
        self.weatherMain = weatherInfoDBModel.weatherMain
        self.weatherDescription = weatherInfoDBModel.weatherDescription
        self.cityName = weatherInfoDBModel.cityName
        self.visibility = "\(weatherInfoDBModel.visibility / 100) km"
        self.windSpeed = "\(weatherInfoDBModel.windSpeed) m/h"
        self.degree = weatherInfoDBModel.degree
        
        self.currentTemperature = "\(weatherInfoDBModel.temperature.tempratureInCelcius())º"
        self.minimumTemperature = "\(weatherInfoDBModel.minimumTemperature.tempratureInCelcius())º"
        self.maximumTemperature = "\(weatherInfoDBModel.maximumTemperature.tempratureInCelcius())º"
        self.pressure = weatherInfoDBModel.pressure
        self.humidity = "\(weatherInfoDBModel.humidity) %"
        self.isWishListed = weatherInfoDBModel.isWishListed
        self.imageName = weatherCondition(rawValue: weatherInfoDBModel.weatherMain)?.rawValue ?? "clear_cloud"
    }
}

extension Float {
    func tempratureInCelcius()->String {
           return String(format: "%.0f", self - 273.15)
       }
}
     
   
