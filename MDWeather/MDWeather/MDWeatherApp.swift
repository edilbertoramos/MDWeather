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
            UserLocationView()
            // TODO: use default coordinate to test
            // defaultCoordinateView
        }
    }
    
    var defaultCoordinateView: some View {
        VStack {
            let coordinate = Coordinate(
                latitude: "34.0194704",
                longitude: "-118.4912273"
            )
            let viewModel = WeatherViewModel.create(with: coordinate)
            WeatherView(viewModel: viewModel)
        }
    }
    
}
