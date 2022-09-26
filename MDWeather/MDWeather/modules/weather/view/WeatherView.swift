//
//  ContentView.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 24/09/22.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel: WeatherViewModel
    private let Label = WeatherConstants.Label.self
    private let labelLightColor = Color(uiColor: WeatherConstants.Color.lightLabel)
    private let labelDarkColor = Color(uiColor: WeatherConstants.Color.darkLabel)
    private let backgroundColor = Color(uiColor: WeatherConstants.Color.background)
    private let placeholder = "     "
    
    var body: some View {
        VStack {
            List {
                HStack {
                    Spacer()
                    VStack {
                        cityName
                        icon
                        tempretatureContainer
                        details
                    }.frame(alignment: .center)
                    Spacer()
                }
                .listRowBackground(backgroundColor)
            }
            .refreshable {
                viewModel.clear()
                viewModel.getWeaherData()
            }
        }.onAppear {
            viewModel.getWeaherData()
        }
    }
    
}

// MARK: - Components
extension WeatherView {
    
    private var cityName: some View {
        VStack {
            Text(viewModel.data?.cityName ?? placeholder)
                .font(.largeTitle.weight(.medium))
                .padding(30)
                .foregroundColor(labelDarkColor)
        }.redacted(reason: viewModel.data == nil ? .placeholder : [])
    }
    
    private var icon: some View {
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
    }
    
    private var tempretatureContainer: some View {
        VStack {
            tempretature
            description
        }.redacted(reason: viewModel.data == nil ? .placeholder : [])
    }

    private var tempretature: some View {
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
        }
    }
    
    private var description: some View {
        VStack {
            Text(viewModel.data?.description.localizedCapitalized ?? placeholder)
                .font(.title2.weight(.medium))
                .foregroundColor(labelLightColor)
        }
    }
    
    private var details: some View {
        VStack {
            minAndMaxTemperature
            wind
        }.padding(30).redacted(reason: viewModel.data == nil ? .placeholder : [])
    }

    private var minAndMaxTemperature: some View {
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
        }
    }
    
    private var wind: some View {
        VStack {
            Text(String(
                format: Label.wind,
                arguments: [
                    viewModel.data?.windSpeed ?? placeholder,
                    viewModel.data?.windDeg ?? placeholder
                ]
            ))
            .font(.title3).italic()
            .foregroundColor(.gray)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let coordinate = Coordinate(
            latitude: "34.0194704",
            longitude: "-118.4912273"
        )
        let viewModel = WeatherViewModel.create(with: coordinate)
        WeatherView(viewModel: viewModel)
    }
    
}
