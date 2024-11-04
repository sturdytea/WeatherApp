//
//
// WeekdayFilterItem.swift
// AstanaWeatherApp
//
// Created by sturdytea on 28.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct WeekdayFilterItem: View {
    
    let weather: ForecastWeather
    var opacity: Double = 1
    
    init(weather: ForecastWeather) {
        self.weather = weather
    }
    
    var body: some View {
        VStack {
            Text(weather.date)
            Divider()
                .frame(width: 30)
                .background(.black)
        }
        .opacity(self.opacity)
        .foregroundStyle(.black)
    }
}
