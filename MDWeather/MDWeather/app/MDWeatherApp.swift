//
//  MDWeatherApp.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import SwiftUI

@main
struct MDWeatherApp: App {
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(.accentColor)
    }
    
    var body: some Scene {
        WindowGroup {
            if WeatherConstants.coordinateMockIsEnable {
                coordinateMockView
            } else {
                UserLocationView()
            }           
        }
    }
    
    var coordinateMockView: some View {
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
