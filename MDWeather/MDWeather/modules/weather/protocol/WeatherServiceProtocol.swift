//
//  WeatherServiceProtocol.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func weather(coordinate: Coordinate) async throws -> MDServiceResult<WeatherResult>
    
    func image(image: ImageScaleDefinitionProtocol, localUrl: String) async throws -> MDServiceResult<URL>

}
