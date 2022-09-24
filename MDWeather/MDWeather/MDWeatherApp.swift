//
//  MDWeatherApp.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import SwiftUI

@main
struct MDWeatherApp: App {
    
    var body: some Scene {
        WindowGroup {
            let viewModel = WeatherViewModel.create()
            WeatherView().environmentObject(viewModel)
        }
    }
    
}
