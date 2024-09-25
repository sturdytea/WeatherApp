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
    
    var cityName = "Astana"
    var sectionOneTitle = "Forecast for 5 days"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text(cityName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink {
//                        DetailsView()
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.custom.primary)
                    .cornerRadius(100)
                    .foregroundColor(.white)
                }
                if let currentWeather = viewModel.currentWeatherRecord {
                                    WeatherInfoContainer(weather: currentWeather)
                                } else {
                                    Text("Loading weather data...")
                                }
                Spacer()
                Text(sectionOneTitle)
                    .padding(EdgeInsets(top: 26, leading: 0, bottom: 0, trailing: 0))
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("\(viewModel.forecastWeatherRecords.count)")
                
                List {
                    ForEach(viewModel.forecastWeatherRecords) { weatherRecord in
                        WeatherInfoContainer(weather: weatherRecord)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    }
                }
                .listStyle(.plain)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
