//
//  WeatherViewModel.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation
import UIKit

final class WeatherViewModel: ObservableObject {
    
    private let service: WeatherServiceProtocol
    private let coordinate: Coordinate
    @Published var data: WeatherViewDataProtocol?
    @Published var icon: UIImage?

    private init(coordinate: Coordinate, service: WeatherServiceProtocol) {
        self.coordinate = coordinate
        self.service = service
    }
    
}

// MARK: - Factory
extension WeatherViewModel {
    
    static func create(with coordinate: Coordinate, and service: WeatherServiceProtocol = WeatherService()) -> WeatherViewModel {
        return WeatherViewModel(coordinate: coordinate, service: service)
    }
    
}

// MARK: - Helper
extension WeatherViewModel {
    
    func clear() {
        data = nil
        icon = nil
    }
    
    func getWeaherData() {
        Task {
            let result = try await service.weather(coordinate: coordinate)
            switch result.result {
            case .success(let weatherResult):
                DispatchQueue.main.async { [weak self] in
                    self?.data = weatherResult
                    self?.getWeaherImage()
                }
            case .failure(let error):
                print("[ERROR] \(error)")
            }
        }
    }
    
    func getWeaherImage() {
        Task {
            guard let data = data else { return }
            let imageScaleDefnition = ImageScaleHelper.shared.getImageScaleDefnition(
                name: data.icon,
                type: WeatherConstants.IconExtension.png
            )
            do {
                let localUrl = try BucketHelper.shared.makeUrl(toImage: imageScaleDefnition.makeFullName())
                let result = try await service.image(image: imageScaleDefnition, localUrl: localUrl)
                
                DispatchQueue.main.async { [weak self] in
                    switch result.result {
                    case .success(let urlResult):
                        do {
                            self?.icon = try BucketHelper.shared.loadImage(for: urlResult)
                        } catch {
                            self?.icon = WeatherConstants.Image.imageNotLoaded
                        }
                    case .failure(_):
                        self?.icon = WeatherConstants.Image.imageNotLoaded
                    }
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.icon = WeatherConstants.Image.imageNotLoaded
                }
            }
        }
    }
    
}
