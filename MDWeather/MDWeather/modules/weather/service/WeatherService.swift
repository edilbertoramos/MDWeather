//
//  MDService.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

final class WeatherService: WeatherServiceProtocol {
    
    private enum EndPoint: String, MDServiceEndpoint {
        case weather
    }
    
    func weather(coordinate: Coordinate) async throws -> MDServiceResult<WeatherResult> {
        let url = try MDServiceHelper.makeUrl(withEndPoint: EndPoint.weather)
        
        var parameters = [String: Any]()
        parameters["appid"] = try AppConfig.shared.apiKey
        parameters["lat"] = coordinate.latitude
        parameters["lon"] = coordinate.longitude
        parameters["units"] = "metric"
        
        return try await MDServiceHelper.get(
            url: url,
            parameters: parameters
        )
    }
    
    func image(image: ImageScaleDefinitionProtocol, localUrl: String) async throws -> MDServiceResult<URL> {
        let url = try MDServiceHelper.makeUrl(withImage: image.makeFullName())
        return try await MDServiceHelper.download(url: url, to: localUrl)
    }
    
}
