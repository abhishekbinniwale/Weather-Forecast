//
//  WeatherInfoDBModel.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 30/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherInfoDBModel: Object {
    //Co-ordinates
    @objc dynamic var latitude : Float = 0.0
    @objc dynamic var longitued : Float = 0.0
   
    //weatherInfo
    @objc dynamic var weatherId : Int = 0
    @objc dynamic var weatherMain : String = ""
    @objc dynamic var weatherDescription : String = ""
    @objc dynamic var weatherIcon : String = ""
    
    //City Info
    @objc dynamic var visibility : Int = 0
    @objc dynamic var timezone : Int = 0
    @objc dynamic var cityId : Int = 0
    @objc dynamic var cityName : String = ""
    
    //Wind
    @objc dynamic var windSpeed : Float = 0.0
    @objc dynamic var degree : Int = 0
    
    //main info
    @objc dynamic var temperature : Float = 0.0  //current temperature
    @objc dynamic var feelsLike : Float = 0.0
    @objc dynamic var minimumTemperature : Float = 0.0 //min current temperature in the city
    @objc dynamic var maximumTemperature : Float = 0.0 //max current temperature in the city
    @objc dynamic var pressure : Int = 0
    @objc dynamic var humidity : Int = 0
    
    //Info Search time stamp
    @objc dynamic var weatherInfoFetchTime : Date? = nil
    
    //Is city is Wish Listed
    @objc dynamic var isWishListed : Bool = false
}

extension WeatherInfoDBModel {
    
    convenience init(model : WeatherInfoModel){
        self.init()
        
        self.latitude   = model.coordinates.latitude
        self.longitued = model.coordinates.longitued
        
         //weatherInfo
        let firstModel = model.weather.first
        self.weatherId = firstModel?.id ?? 0
        self.weatherMain  = firstModel?.main ?? ""
        self.weatherDescription = firstModel?.description ?? ""
        self.weatherIcon  = firstModel?.icon ?? ""
         
         //City Info
        self.visibility  = model.visibility
        self.timezone  = model.timezone
        self.cityId  = model.cityId
        self.cityName  = model.cityName
         
         //Wind
        self.windSpeed = model.wind.windSpeed
        self.degree  = model.wind.degree
         
         //main info
        self.temperature  = model.mainInfo.temperature  //current temperature
        self.feelsLike  = model.mainInfo.feelsLike
        self.minimumTemperature  = model.mainInfo.minimumTemperature //min current temperature in the city
        self.maximumTemperature  = model.mainInfo.maximumTemperature //max current temperature in the city
        self.pressure  = model.mainInfo.pressure
        self.humidity  = model.mainInfo.humidity
         
         //Info Search time stamp
         self.weatherInfoFetchTime = Date()
         
         //Is city is Wish Listed
         self.isWishListed = false
    }
}
