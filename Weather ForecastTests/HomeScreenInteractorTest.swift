//
//  HomeScreenInteractorTest.swift
//  Weather ForecastTests
//
//  Created by Abhishek Binniwale on 01/09/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import Weather_Forecast


class HomeScreenInteractorTest: XCTestCase {

    var interactor : HomeScreenInteractor?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = HomeScreenInteractor()
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
        super.tearDown()
    }

    func testSearchForWeatherReport() {
        interactor?.searchWeatherReportFor(city: "mumbai", completion: { (result) in
            switch result {
            case let .success(weatherInfoDBModel):
                XCTAssertNotNil(weatherInfoDBModel)
                break
            case let .failure(error):
                XCTAssertNil(error)
                break
            }
        })
    }
}
