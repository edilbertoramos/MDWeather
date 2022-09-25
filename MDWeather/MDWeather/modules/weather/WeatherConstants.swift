//
//  WeatherConstants.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import UIKit

struct WeatherConstants {
    
    enum CustomColor {
        static let main = UIColor.hex("#242424")
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
    
}
