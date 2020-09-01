//
//  HomeScreenViewControllerTest.swift
//  Weather ForecastTests
//
//  Created by Abhishek Binniwale on 01/09/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import Weather_Forecast

class HomeScreenViewControllerTest: XCTestCase {

    var homeScreenViewController : HomeScreenViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        homeScreenViewController = controller
        homeScreenViewController?.loadViewIfNeeded()
        super.setUp()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        homeScreenViewController = nil
        super.tearDown()
    }

    func testContentView() {
        XCTAssertNotNil(homeScreenViewController?.contentViewOutlet)
    }

    func testTopViewOutlet(){
        XCTAssertNotNil(homeScreenViewController?.weatherImage)
        XCTAssertNotNil(homeScreenViewController?.cityNameLabel)
        XCTAssertNotNil(homeScreenViewController?.weatherTypeLabel)
    }
    
    func testBottomViewOutlet(){
        XCTAssertNotNil(homeScreenViewController?.highLowTemperatureLabel)
        XCTAssertNotNil(homeScreenViewController?.humidityLabel)
        XCTAssertNotNil(homeScreenViewController?.visibilityLabel)
        XCTAssertNotNil(homeScreenViewController?.windLabel)
    }
}
