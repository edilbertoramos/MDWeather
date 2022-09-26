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
    private let labelLightColor = Color(uiColor: WeatherConstants.Color.lightLabel)
    private let labelDarkColor = Color(uiColor: WeatherConstants.Color.darkLabel)
    private let placeholder = "     "
    
    var body: some View {
        Color.accentColor.ignoresSafeArea()
            .overlay(
                VStack {
                    Text(viewModel.data?.cityName ?? placeholder)
                        .font(.largeTitle.weight(.medium))
                        .padding(30)
                        .foregroundColor(labelDarkColor)
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
                        .foregroundColor(labelDarkColor)
                        Text(viewModel.data?.description.localizedCapitalized ?? placeholder)
                            .font(.title2.weight(.medium))
                            .foregroundColor(labelLightColor)
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
                        .foregroundColor(labelLightColor)
                        Text(String(
                            format: Label.wind,
                            arguments: [
                                viewModel.data?.windSpeed ?? placeholder,
                                viewModel.data?.windDeg ?? placeholder
                            ]
                        ))
                        .font(.title3).italic()
                        .foregroundColor(.gray)
                    }.padding(30).redacted(reason: viewModel.data == nil ? .placeholder : [])
                    
                }.onAppear {
                    viewModel.getWeaherData()
                }
            )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let coordinate = Coordinate(
            latitude: "34.0194704",
            longitude: "-118.4912273"
        )
        let viewModel = WeatherViewModel.create(with: coordinate)
        WeatherView().environmentObject(viewModel)
    }
    
}
