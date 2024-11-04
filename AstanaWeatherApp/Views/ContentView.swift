//
//
// ContentView.swift
// AstanaWeatherApp
//
// Created by sturdytea on 15.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if let currentWeather = viewModel.currentWeatherRecord {
                    WeatherInfoContainer(weather: currentWeather)
                } else {
                    Text("Loading weather data...")
                }
                // MARK: - Temperature
                Text("Temperature")
                    .padding(.top, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.hourlyWeatherRecords) { weatherRecord in
                            HourWeatherItem(weather: weatherRecord)
                        }
                    }
                }
                // MARK: - Detail Information
                Text("Detail Information")
                    .padding(.top, 16)
                if let airPolution = viewModel.airPolutionDataRecord {
                    AirPolutionContainer(airPolution)
                }
                
                if let currentWeather = viewModel.currentWeatherRecord {
                    WeatherDetailsContainer(weather: currentWeather)
                }
                
            }
            .padding()
            .font(.custom("Montserrat-SemiBold", size: 16))
        }
    }
}

#Preview {
    ContentView()
}
