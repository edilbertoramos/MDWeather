//
//  WeatherResult.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

final class WeatherResult: Codable {
    
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

// MARK: - WeatherViewDataProtocol
extension WeatherResult: WeatherViewDataProtocol {
    
    var cityName: String {
        name
    }
    
    var icon: String {
        firstWeather?.icon ?? .init()
    }
    
    var description: String {
        firstWeather?.description ?? .init()
    }
    
    var currentTemperature: String {
        String(main.temp)
    }
    
    var minTemperature: String {
        String(main.temp_min)
    }
    
    var maxTemperature: String {
        String(main.temp_max)
    }
    
    var windSpeed: String {
        String(wind.speed)
    }
    
    var windDeg: String {
        String(wind.deg)
    }

}
