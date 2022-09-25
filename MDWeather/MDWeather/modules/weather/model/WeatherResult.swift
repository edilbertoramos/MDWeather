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
        main.temp.toCeilString
    }
    
    var minTemperature: String {
        main.tempMin.toCeilString
    }
    
    var maxTemperature: String {
        main.tempMax.toCeilString
    }
    
    var windSpeed: String {
        wind.speed.toDecimalString
    }
    
    var windDeg: String {
        String(wind.deg)
    }

}
