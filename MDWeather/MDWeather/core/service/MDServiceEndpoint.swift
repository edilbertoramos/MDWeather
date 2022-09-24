//
//  MDServiceEndpoint.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import Foundation

public protocol MDServiceEndpoint {
    
    var endpoint: String { get }
    
}

// MARK: - Default to String
extension MDServiceEndpoint where Self: RawRepresentable, Self.RawValue == String {
    
    public var endpoint: String {
        return self.rawValue
    }
    
}
