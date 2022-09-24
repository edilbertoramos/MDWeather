//
//  WeatherResult.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

struct WeatherResult: Codable {
    
    let id: Int
    let name: String
    let weather: [Weather]
    let main: Temperature
    let wind: Wind
    
}

// MARK: - Helper
extension WeatherResult {
    
    var firstWeather: Weather? {
        return weather.first
    }
    
}
