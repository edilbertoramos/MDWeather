//
//  WeatherConstants.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import UIKit

struct WeatherConstants {
    
    // TODO: enable to use coordinate mock to test: Default - false
    static let coordinateMockIsEnable: Bool = false
    
    enum Color {
        static let darkLabel = UIColor.hex("#242424")
        static let lightLabel = UIColor.hex("#967802")
        static let background = UIColor.hex("#fbdc4f")
    }
    
    enum IconExtension {
        static let png = "png"
    }
    
    enum Image {
        static let imageNotLoaded = UIImage(systemName: "photo")
    }
    
    enum Label {
        static let temperature = "%@º"
        static let minAndMaxTemperature = "Low: %@º  High: %@º"
        static let wind = "Wind: %@ (%@)"
    }
    
    enum UnitType {
        static let metric = "metric"
    }
    
}
