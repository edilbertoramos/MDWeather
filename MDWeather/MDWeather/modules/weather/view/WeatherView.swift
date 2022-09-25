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
    private let placeholder = "-----"
    
    var body: some View {
        Color.accentColor.ignoresSafeArea()
            .overlay(
                VStack {
                    Text(viewModel.data?.cityName ?? placeholder)
                        .font(.system(size: 30))
                        .padding(30)
                        .foregroundColor(labelColor)
                        .redacted(reason: viewModel.data == nil ? .placeholder : [])
                    VStack {
                        if let icon = viewModel.icon {
                            Image(uiImage: icon)
                                .frame(width: 20, height: 20)
                        } else {
                            Image(uiImage: WeatherConstants.Image.imageNotLoaded ?? .init())
                                .frame(width: 20, height: 20)
                                .foregroundColor(.orange)
                                .cornerRadius(10)
                        }
                    }.redacted(reason: viewModel.icon == nil ? .placeholder : [])
                    VStack {
                        Text(String(
                            format: Label.temperature,
                            arguments: [viewModel.data?.currentTemperature ?? placeholder]
                        ))
                        .font(
                            .system(size: 90)
                            .weight(.thin)
                        )
                        .foregroundColor(labelColor)
                        Text(viewModel.data?.description.localizedCapitalized ?? placeholder)
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }.redacted(reason: viewModel.data == nil ? .placeholder : [])
                    VStack {
                        Text(String(
                            format: Label.minAndMaxTemperature,
                            arguments: [
                                viewModel.data?.minTemperature ?? placeholder,
                                viewModel.data?.maxTemperature ?? placeholder]
                        ))
                        .font(.title3).italic()
                        .padding(2)
                        .foregroundColor(labelColor)
                        Text(String(
                            format: Label.wind,
                            arguments: [
                                viewModel.data?.windSpeed ?? placeholder,
                                viewModel.data?.windDeg ?? placeholder
                            ]
                        ))
                        .font(.title3).italic()
                        .foregroundColor(.cyan)
                    }.padding(30).redacted(reason: viewModel.data == nil ? .placeholder : [])
                    
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
