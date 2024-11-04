//
//
// HourWeatherItem.swift
// AstanaWeatherApp
//
// Created by sturdytea on 29.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct HourWeatherItem: View {
    
    let weather: HourlyWeather
    
    init(weather: HourlyWeather) {
        self.weather = weather
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(weather.temp)℃")
            Image(weather.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
            Text("\(weather.time)")
                .font(.custom("Montserrat-Light", size: 12))
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 6 - 16,  maxHeight: 60)
        .padding(EdgeInsets(top: 16, leading: 12, bottom: 14, trailing: 12))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.custom("Montserrat-Regular", size: 14))
        .cornerRadius(18)
    }
}
