//
//
// WeatherInfoContainer.swift
// AstanaWeatherApp
//
// Created by sturdytea on 15.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct WeatherInfoContainer: View {
    
    let weather: CurrentWeather
    
    init(weather: CurrentWeather) {
        self.weather = weather
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(weather.date)
                Text(weather.cityName)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .opacity(0.7)
                Spacer()
                Text(weather.temp)
                    .font(.custom("Montserrat-SemiBold", size: 44))
                    .padding(.bottom, 4)
                HStack {
                    Text(weather.maxTemp)
                    Divider()
                        .frame(width: 1)
                        .frame(height: 16)
                        .background(.white)
                        .opacity(0.3)
                    Text(weather.minTemp)
                        .opacity(0.3)
                }
            }
            Spacer()
            ZStack(alignment: .trailing) {
                VStack {
                    Text(weather.year)
                    Spacer()
                }
                Image(weather.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 16,  maxHeight: 140)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.custom("Montserrat-SemiBold", size: 16))
        .cornerRadius(20)
    }
}
