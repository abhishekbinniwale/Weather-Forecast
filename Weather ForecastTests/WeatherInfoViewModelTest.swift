//
//  WeatherInfoViewModelTest.swift
//  Weather ForecastTests
//
//  Created by Abhishek Binniwale on 01/09/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import Weather_Forecast

class WeatherInfoViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherInfoViewModel() {
        
        let expectation = XCTestExpectation(description: "Download weather data")
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
             let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
             let weatherInfoViewModel = WeatherInfoViewModel(weatherInfoDBModel: weatherInfoDBModel)
              XCTAssertNotNil(weatherInfoDBModel)
              XCTAssertNotNil(weatherInfoViewModel)
                expectation.fulfill()
                break
            case .failure(_):
                expectation.fulfill()
                break
            }
        }
    }

    
    func testWeatherInfoViewModelProperties() {
        
        let expectation = XCTestExpectation(description: "Download weather data")
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                let weatherInfoDBModel = WeatherInfoDBModel(model: weatherInfoDBModel)
                let weatherInfoViewModel = WeatherInfoViewModel(weatherInfoDBModel: weatherInfoDBModel)
                XCTAssertNotNil(weatherInfoDBModel)
                XCTAssertNotNil(weatherInfoViewModel)
                
                XCTAssertNotNil(weatherInfoViewModel.cityName)
                XCTAssertNotNil(weatherInfoViewModel.weatherDescription)
                XCTAssertNotNil(weatherInfoViewModel.currentTemperature)
                XCTAssertNotNil(weatherInfoViewModel.degree)
                XCTAssertNotNil(weatherInfoViewModel.feelsLike)
                XCTAssertNotNil(weatherInfoViewModel.humidity)
                XCTAssertNotNil(weatherInfoViewModel.visibility)
                XCTAssertNotNil(weatherInfoViewModel.weatherMain)
                XCTAssertNotNil(weatherInfoViewModel.isWishListed)
                XCTAssertNotNil(weatherInfoViewModel.minimumTemperature)
                XCTAssertNotNil(weatherInfoViewModel.maximumTemperature)
                XCTAssertNotNil(weatherInfoViewModel.pressure)
                XCTAssertNotNil(weatherInfoViewModel.imageName)
                XCTAssertNotNil(weatherInfoViewModel.windSpeed)
                expectation.fulfill()
                break
            case .failure(_):
                expectation.fulfill()
                break
            }
        }
    }
}
