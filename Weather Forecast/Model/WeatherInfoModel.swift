//
//  WeatherInfoModel.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 30/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

struct WeatherInfoModel : Decodable {
    
    let coordinates : Coordinates
    let weather : [Weather]
    let mainInfo : MainInfo
    let visibility : Int
    let wind : Wind
    let timezone : Int
    let cityId : Int
    let cityName : String
    
    enum CodingKeys: String, CodingKey{
        case coordinates = "coord"
        case weather = "weather"
        case mainInfo = "main"
        case visibility
        case wind
        case timezone
        case cityId = "id"
        case cityName =  "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coordinates = try values.decode(Coordinates.self, forKey: .coordinates)
        weather = try values.decode([Weather].self, forKey: .weather)
        mainInfo = try values.decode(MainInfo.self, forKey: .mainInfo)
        visibility = try values.decode(Int.self, forKey: .visibility)
        wind       = try values.decode(Wind.self, forKey: .wind)
        timezone = try values.decode(Int.self, forKey: .timezone)
        cityId = try values.decode(Int.self, forKey: .cityId)
        cityName = try values.decode(String.self, forKey: .cityName)
    }
}

struct Coordinates : Decodable {
    
    let latitude : Float
    let longitued : Float
    
    enum CodingKeys: String, CodingKey{
        case latitude = "lat"
        case longitued = "lon"
    }
}

struct Weather :  Decodable {
    let id : Int
    let main : String
    let description : String
    let icon : String
}

struct MainInfo : Decodable {
    let temperature : Float
    let feelsLike : Float
    let minimumTemperature : Float
    let maximumTemperature : Float
    let pressure : Int
    let humidity : Int
    
    enum CodingKeys: String, CodingKey{
        case temperature = "temp"
        case feelsLike = "feels_like"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind : Decodable {
    let windSpeed : Float
    let degree : Int
    
    enum CodingKeys: String, CodingKey{
        case windSpeed = "speed"
        case degree = "deg"
    }
}

