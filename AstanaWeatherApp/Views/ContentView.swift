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
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // MARK: - Current Weather
                if let currentWeather = viewModel.currentWeatherRecord {
                    WeatherInfoContainer(weather: currentWeather)
                } else {
                    SkeletonCellView()
                }
                // MARK: - Temperature
                if !viewModel.hourlyWeatherRecords.isEmpty {
                    Text(LocalizedContent.temperatureTitle)
                        .padding(.top, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.hourlyWeatherRecords) { weatherRecord in
                                HourWeatherItem(weather: weatherRecord)
                            }
                        }
                    }
                } else {
                    SkeletonCellView(height: 16)
                        .padding(.top, 16)
                    SkeletonCellView(height: 60)
                }
                
                // MARK: - Detail Information
                if let airPolution = viewModel.airPolutionDataRecord {
                    Text(LocalizedContent.detailsTitle)
                        .padding(.top, 16)
                    
                    AirPolutionContainer(data: airPolution)
                } else {
                    SkeletonCellView(height: 16)
                        .padding(.top, 16)
                    
                    SkeletonCellView(height: 90)
                }
                
                if let currentWeather = viewModel.currentWeatherRecord {
                    WeatherDetailsContainer(weather: currentWeather)
                } else {
                    SkeletonCellView(height: 130)
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
