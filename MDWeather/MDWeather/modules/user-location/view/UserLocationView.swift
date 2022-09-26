//
//  UserLocationView.swift
//  MDWeather
//
//  Created by Edilberto Ramos on 25/09/22.
//

import SwiftUI

struct UserLocationView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        Color.accentColor.ignoresSafeArea()
            .overlay(
                VStack {
                    if locationManager.hasAuthorization {
                        weatherView
                    }
                    if locationManager.denied {
                        deinedView
                    }
                }.onAppear {
                    locationManager.requestLocation()
                }
            )
    }
    
    var weatherView: some View {
        VStack {
            if let location = locationManager.location {
                let coordinate = Coordinate(
                    latitude: String(location.latitude),
                    longitude: String(location.longitude)
                )
                let viewModel = WeatherViewModel.create(with: coordinate)
                WeatherView().environmentObject(viewModel)
            }
        }
    }
    
    var deinedView: some View {
        VStack {
            Image(uiImage: UserLocationConstants.Image.deined ?? .init())
                .resizable()
                .frame(width: 20, height: 30, alignment: .center)
            Text(UserLocationConstants.Label.deined).foregroundColor(.black)
        }
    }
    
}
