//
//  WeatherInfoModelTest.swift
//  Weather ForecastTests
//
//  Created by Abhishek Binniwale on 01/09/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import Weather_Forecast

class WeatherInfoModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoordinates() {
        let  coordinates = Coordinates(latitude: 72.85, longitued: 19.01)
        XCTAssertNotNil(coordinates)
        XCTAssertNotNil(coordinates.latitude)
        XCTAssertNotNil(coordinates.longitued)
        XCTAssertEqual(72.85, coordinates.latitude)
        XCTAssertEqual(19.01, coordinates.longitued)
    }
   
   
    func testWeather(){
        let weather = Weather(id: 501, main: "Rain", description: "moderate rain", icon: "10n")
        XCTAssertNotNil(weather)
        XCTAssertEqual(501, weather.id)
        XCTAssertEqual("Rain", weather.main)
        XCTAssertEqual("moderate rain", weather.description)
        XCTAssertEqual("10n", weather.icon)
    }
    
    func testMainInfo(){
        let mainInfo = MainInfo(temperature: 299.15, feelsLike: 304.08, minimumTemperature: 299.15, maximumTemperature: 299.15, pressure:  1005, humidity: 94)
        XCTAssertNotNil(mainInfo)
        XCTAssertEqual(299.15, mainInfo.temperature)
        XCTAssertEqual(304.08, mainInfo.feelsLike)
        XCTAssertEqual(299.15, mainInfo.minimumTemperature)
        XCTAssertEqual(299.15, mainInfo.maximumTemperature)
        XCTAssertEqual(1005, mainInfo.pressure)
        XCTAssertEqual(94, mainInfo.humidity)
    }
    
    func testWind(){
        let wind = Wind(windSpeed: 2.1, degree: 180)
        XCTAssertNotNil(wind)
        XCTAssertEqual(2.1, wind.windSpeed)
        XCTAssertEqual(180, wind.degree)
    }
}
