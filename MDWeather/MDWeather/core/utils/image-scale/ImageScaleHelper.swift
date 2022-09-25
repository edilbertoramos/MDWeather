//
//  ImageScaleHelper.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation
import UIKit

public struct ImageScaleHelper {
    
    public static let shared = ImageScaleHelper()
    
    private init() {}
    
    func getImageScaleDefnition(name: String, type: String) -> ImageScaleDefinitionProtocol {
        let defaultScale = DefaultImageScale(name: name, type: type)
        let scaleTwo = ImageScaleTwo(name: name, type: type)
        let scaleThree = ImageScaleThree(name: name, type: type)
        
        switch UIScreen.main.scale {
        case scaleTwo.scale:
            return scaleTwo
        case scaleThree.scale:
            // TODO: Icons with scale 3.0 (@3x) aren't available at http://openweathermap.org/img/wn/
            // return scaleThree
            return scaleTwo
        default:
            return defaultScale
        }
    }
    
}
