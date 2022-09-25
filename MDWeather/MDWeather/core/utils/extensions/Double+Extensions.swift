//
//  Double+Extensions.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 25/09/22.
//

import Foundation

public extension Double {
    
    var toDecimalString: String {
        let formmatter = NumberFormatter()
        formmatter.numberStyle = .decimal
        return formmatter.string(from: self as NSNumber) ?? String(self)
    }
    
    var toCeilString: String {
        String(Int(ceil(self)))
    }
    
}
