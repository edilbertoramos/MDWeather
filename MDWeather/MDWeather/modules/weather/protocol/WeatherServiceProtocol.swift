//
//  WeatherServiceProtocol.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func weather(latitude: String, longitude: String) async throws -> MDServiceResult<WeatherResult>
    
}
