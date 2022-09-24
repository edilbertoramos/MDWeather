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
    
    func weather(latitude: String, longitude: String) async throws -> MDServiceResult<WeatherResult> {
        let url = try MDServiceHelper.makeUrl(withEndPoint: EndPoint.weather)
        
        var parameters = [String: Any]()
        parameters["appid"] = "d4277b87ee5c71a468ec0c3dc311a724"
        parameters["lat"] = latitude
        parameters["lon"] = longitude
        
        return try await MDServiceHelper.get(
            url: url,
            parameters: parameters
        )
    }
    
}
