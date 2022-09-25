//
//  ContentView.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    private let Label = WeatherConstants.Label.self
    private let labelColor = Color.white
    
    var body: some View {
        Color.indigo.ignoresSafeArea()
            .overlay(
                VStack {
                    if let data = viewModel.data {
                        Text(data.cityName)
                            .font(.title)
                            .padding(20)
                            .foregroundColor(labelColor)
                        if let icon = viewModel.icon ?? WeatherConstants.Image.imageNotLoaded  {
                            Image(uiImage: icon)
                                .frame(width: 20, height: 20)
                        }
                        VStack {
                            Text(String(
                                format: Label.temperature,
                                arguments: [data.currentTemperature]
                            ))
                            .font(
                                .system(size: 80)
                                .weight(.thin)
                            )
                            .foregroundColor(labelColor)
                            Text(data.description.localizedCapitalized)
                                .font(.title2)
                                .foregroundColor(labelColor)
                        }
                        VStack {
                            Text(String(
                                format: Label.minAndMaxTemperature,
                                arguments: [data.minTemperature, data.maxTemperature]
                            ))
                            .font(.title3)
                            .padding(2)
                            .foregroundColor(labelColor)
                            Text(String(
                                format: Label.wind,
                                arguments: [data.windSpeed, data.windDeg]
                            ))
                            .font(.title3)
                            .foregroundColor(labelColor)
                        }.padding()
                    }
                }.onAppear {
                    viewModel.getWeaherData()
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = WeatherViewModel.create()
        WeatherView().environmentObject(viewModel)
    }
    
}
