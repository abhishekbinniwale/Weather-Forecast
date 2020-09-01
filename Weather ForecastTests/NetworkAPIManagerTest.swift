//
//  NetworkAPIManagerTest.swift
//  Weather ForecastTests
//
//  Created by Abhishek Binniwale on 01/09/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import Weather_Forecast

class NetworkAPIManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAPICall() {
        NetworkAPIManager.sharedInstance.fetchWeatherDataFor(city: "mumbai") { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                XCTAssertNotNil(weatherInfoDBModel)
                break
            case let .failure(error):
                XCTAssertNil(error)
                break
            }
        }
    }

    func testAPIKey() {
        XCTAssertNotNil(NetworkAPIManager.sharedInstance.API_KEY)
    }
}
