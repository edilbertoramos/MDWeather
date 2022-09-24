//
//  AppConfigTests.swift
//  MDWeatherTests
//
//  Created by Edilberto Ramos on 24/09/22.
//

import XCTest
@testable import MDWeather

class AppConfigTests: XCTestCase {

    private let baseUrl = "https://api.openweathermap.org/data/2.5"
    
    func testBaseUrl() throws {
        let url = try AppConfig.shared.baseUrl
        assert(url == baseUrl)
    }

}
