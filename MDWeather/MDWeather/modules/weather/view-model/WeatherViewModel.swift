//
//  WeatherViewModel.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    
    private let service: WeatherServiceProtocol
    
    private init(service: WeatherServiceProtocol) {
        self.service = service
    }
    
}

// MARK: - Factory
extension WeatherViewModel {
    
    static func create(with service: WeatherServiceProtocol = WeatherService()) -> WeatherViewModel {
        return WeatherViewModel(service: service)
    }
    
}

// MARK: - Helper
extension WeatherViewModel {
    
    func weaher() {
    // TODO: created to test service
        Task {
            let result = try await WeatherService().weather(
                latitude: "34.0194704",
                longitude: "-118.4912273"
            )
            switch result.result {
            case .success(let watherResult):
                print(watherResult.name)
                print(watherResult.firstWeather?.icon ?? .init())
                print(watherResult.firstWeather?.description ?? .init())
                print(watherResult.main.temp)
                print(watherResult.main.temp_min)
                print(watherResult.main.temp_max)
                print(watherResult.wind.speed)
                print(watherResult.wind.deg)
            case .failure(let error):
                print("[ERROR] \(error)")
            }
        }
    }
    
}
