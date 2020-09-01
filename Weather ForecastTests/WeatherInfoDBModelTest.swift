//
//  WeatherInfoDBModelTest.swift
//  Weather ForecastTests
//
//  Created by Abhishek Binniwale on 01/09/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import Weather_Forecast

class WeatherInfoDBModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWeatherInfoDBModel() {
           let expectation = XCTestExpectation(description: "Download weather data")
           NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
               switch result {
               case let .success(weatherInfoDBModel):
                let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
                    XCTAssertNotNil(weatherInfoDBModel)
                   expectation.fulfill()
                   break
               case .failure(_):
                   expectation.fulfill()
                   break
               }
           }
    }

    func testWeatherInfoDBModelProperties(){
        
        let expectation = XCTestExpectation(description: "Download weather data")
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
                XCTAssertNotNil(weatherInfoDBModel.cityId)
                XCTAssertNotNil(weatherInfoDBModel.cityName)
                XCTAssertNotNil(weatherInfoDBModel.latitude)
                XCTAssertNotNil(weatherInfoDBModel.longitued)
                expectation.fulfill()
                break
            case .failure(_):
                expectation.fulfill()
                break
            }
        }
    }
    
    
    func testWeatherInfoDBModelWeatherInfo(){
        let expectation = XCTestExpectation(description: "Download weather data")
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
                XCTAssertNotNil(weatherInfoDBModel.weatherId)
                       XCTAssertNotNil(weatherInfoDBModel.weatherMain)
                       XCTAssertNotNil(weatherInfoDBModel.weatherDescription)
                       XCTAssertNotNil(weatherInfoDBModel.weatherIcon)
                       XCTAssertNotNil(weatherInfoDBModel.weatherInfoFetchTime)
                expectation.fulfill()
                break
            case .failure(_):
                expectation.fulfill()
                break
            }
        }
    }
    
    func testWeatherInfoDBModelCoordinateAndWind(){
    
        let expectation = XCTestExpectation(description: "Download weather data")
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
                XCTAssertNotNil(weatherInfoDBModel.latitude)
                XCTAssertNotNil(weatherInfoDBModel.longitued)
                XCTAssertNotNil(weatherInfoDBModel.windSpeed)
                XCTAssertNotNil(weatherInfoDBModel.degree)
                expectation.fulfill()
                break
            case .failure(_):
                expectation.fulfill()
                break
            }
        }
    }
    
    
    func testWeatherInfoDBModelMainInfo(){
        let expectation = XCTestExpectation(description: "Download weather data")
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
                XCTAssertNotNil(weatherInfoDBModel.temperature)
                XCTAssertNotNil(weatherInfoDBModel.feelsLike)
                XCTAssertNotNil(weatherInfoDBModel.minimumTemperature)
                XCTAssertNotNil(weatherInfoDBModel.maximumTemperature)
                XCTAssertNotNil(weatherInfoDBModel.pressure)
                XCTAssertNotNil(weatherInfoDBModel.humidity)
                expectation.fulfill()
                break
            case .failure(_):
                expectation.fulfill()
                break
            }
        }
    }
    
}
