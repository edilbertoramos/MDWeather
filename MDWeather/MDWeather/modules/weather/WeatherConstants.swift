//
//  WeatherConstants.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import UIKit

struct WeatherConstants {
    
    enum Image {
        static let imageNotLoaded = UIImage(systemName: "photo.fill")
    }
    
    enum Label {
        static let temperature = "%@º"
        static let minAndMaxTemperature = "Low: %@º  High: %@º"
        static let wind = "Wind: %@ (%@)"
    }
    
}
