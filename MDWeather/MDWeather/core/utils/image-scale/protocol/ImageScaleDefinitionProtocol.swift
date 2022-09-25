//
//  ImageScaleDefinitionProtocol .swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import UIKit

public protocol ImageScaleDefinitionProtocol {
    
    var scale: CGFloat { get }
    var scaleDescription: String { get }
    var name: String { get }
    var type: String { get }

    init(name: String, type: String)
    
}

// MARK: - Default
public extension ImageScaleDefinitionProtocol {
    
    func makeFullName() -> String {
        return String(
            format: "%@%@.%@",
            arguments: [
                name,
                scaleDescription,
                type
            ]
        )
    }
    
}
