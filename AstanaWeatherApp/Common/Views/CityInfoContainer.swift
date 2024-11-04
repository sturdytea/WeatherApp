//
//
// CityInfoContainer.swift
// AstanaWeatherApp
//
// Created by sturdytea on 22.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct CityInfoContainer: View {
    @ObservedObject var weather: CurrentWeather
    
    init(weather: CurrentWeather) {
        self.weather = weather
    }
    
    var body: some View {
        VStack {
            Image(weather.icon)
                .resizable()
                .frame(width: 168, height: 168)
                .padding(.top, 16)
                .padding(EdgeInsets(top: 16, leading: 40, bottom: 26, trailing: 40))
            Text(weather.cityName)
                .font(.body)
                .padding(.bottom, 4)
            Text("\(Int(weather.temp))℃")
                .font(.largeTitle)
            Text(weather.main)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(8)
        }
        .padding(16)
        .background(.widgetBackground)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}
