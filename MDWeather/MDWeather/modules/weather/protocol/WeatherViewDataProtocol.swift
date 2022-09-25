//
//  WeatherViewDataProtocol.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

protocol WeatherViewDataProtocol: AnyObject {
    
    var cityName: String { get }
    var icon: String { get }
    var description: String { get }
    var currentTemperature: String { get }
    var minTemperature: String { get }
    var maxTemperature: String { get }
    var windSpeed: String { get }
    var windDeg: String { get }
    
}
