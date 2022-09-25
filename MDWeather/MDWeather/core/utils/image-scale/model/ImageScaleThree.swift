//
//  ImageScaleThree.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import UIKit

struct ImageScaleThree: ImageScaleDefinitionProtocol {
    
    var scale: CGFloat { 3.0 }
    var name: String
    var type: String

    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    
    var scaleDescription: String {
        "@\(Int(scale))x"
    }
    
}
