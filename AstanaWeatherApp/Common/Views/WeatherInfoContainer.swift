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
    
    let weather: WeatherProtocol
    
    init(weather: CurrentWeather) {
        self.weather = weather
    }
    
    init(weather: ForecastWeather) {
        self.weather = weather
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(weather.day)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(EdgeInsets(top: 26, leading: 0, bottom: 16, trailing: 0))
                Text(weather.main)
                    .padding(.top, 8)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Image(weather.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.top, 16)
                    .foregroundColor(.white)
                Text("\(Int(weather.temp))℃")
                    .padding(.top, 8)
            }
        }
        .padding(16)
        .background(Color.custom.primary)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}

#Preview {
    WeatherInfoContainer(weather: CurrentWeather(CurrentResponseBody(
            name: "Test City",
            dt: 0,
            weather: [WeatherResponse(id: 1, main: "Clear", icon: "cloud.sun")],
            main: MainResponse(temp: 300.0, pressure: 1012, humidity: 50),
            wind: WindResponse(speed: 5.0)
        )))
}
