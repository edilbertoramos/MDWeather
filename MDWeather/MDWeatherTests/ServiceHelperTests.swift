//
//  ServiceHelperTests.swift
//  MDWeatherTests
//
//  Created by Edilberto Ramos on 24/09/22.
//

import XCTest
@testable import MDWeather

class ServiceHelperTests: XCTestCase {
    
    private enum EndPoint: String, MDServiceEndpoint {
        case test
    }
    
    func testMakeUrl() throws {
        let baseUrl = try MDServiceHelper.baseUrl
        let testUrl = "\(baseUrl)/\(EndPoint.test.rawValue)"
        let url = try MDServiceHelper.makeUrl(withEndPoint: EndPoint.test)
        
        assert(url == testUrl)
    }
    
}
