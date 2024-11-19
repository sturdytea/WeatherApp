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
    
    @ObservedObject var viewModel = WeatherViewModel() // TODO: Use DependancyInjection
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // MARK: - Current Weather
                if let currentWeather = viewModel.currentWeatherRecord {
                    WeatherInfoContainer(weather: currentWeather)
                } else {
                    Text(LocalizedContent.loading)
                }
                // MARK: - Temperature
                Text(LocalizedContent.temperatureTitle)
                    .padding(.top, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.hourlyWeatherRecords) { weatherRecord in
                            HourWeatherItem(weather: weatherRecord)
                        }
                    }
                }
                // MARK: - Detail Information
                Text(LocalizedContent.detailsTitle)
                    .padding(.top, 16)
                if let airPolution = viewModel.airPolutionDataRecord {
                    AirPolutionContainer(data: airPolution)
                }
                
                if let currentWeather = viewModel.currentWeatherRecord {
                    WeatherDetailsContainer(weather: currentWeather)
                }
            }
            .padding()
            .font(.primaryTitle)
        }
    }
}

#Preview {
    ContentView()
}
