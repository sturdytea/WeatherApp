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
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(weather.temp)\(LocalizedContent.Symbol.celsius)")
            Image(weather.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
            Text("\(weather.time)")
                .font(.primaryDescription)
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 6 - 16,  maxHeight: 60)
        .padding(EdgeInsets(top: 16, leading: 12, bottom: 14, trailing: 12))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.secondaryTitle)
        .cornerRadius(18)
    }
}
