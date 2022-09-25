//
//  ContentView.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
            if let data = viewModel.data {
                Text(data.cityName)
                    .padding(5)
                    .font(.title2)
                if let icon = viewModel.icon {
                    Image(uiImage: icon)
                }
                VStack {
                    Text(String(
                        format: "%@º",
                        arguments: [data.currentTemperature]
                    )).font(.largeTitle)
                    Text(data.description.capitalized)
                        .font(.body)
                }.padding(5)
                VStack {
                    Text(String(
                        format: "Low: %@º High: %@º",
                        arguments: [data.minTemperature, data.maxTemperature]
                    ))
                    .font(.title3)
                    .padding(5)
                    Text(String(
                        format: "Wind: %@ (%@)",
                        arguments: [data.windSpeed, data.windDeg]
                    ))
                    .font(.title3)
                }.padding()
            }
        }
        .onAppear {
            viewModel.getWeaherData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
