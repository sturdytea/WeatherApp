//
//
// WeatherDetailsContainer.swift
// AstanaWeatherApp
//
// Created by sturdytea on 30.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct WeatherDetailsContainer: View {
    let weather: CurrentWeather
    
    init(weather: CurrentWeather) {
        self.weather = weather
    }

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 90))
        ], spacing: 20) {
            DetailsGridItem("temperature", value: weather.feelsLike, "Feels Like")
            DetailsGridItem("rain", value: weather.rain, "Rain")
            DetailsGridItem("humidity", value: weather.humidity, "Humidity")
            DetailsGridItem("wind", value: weather.wind, "Wind")
            DetailsGridItem("visibility", value: weather.visibility, "Visibility")
            DetailsGridItem("pressure", value: weather.pressure, "Pressure")
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 16, maxHeight: 130)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.custom("Montserrat-SemiBold", size: 16))
        .cornerRadius(20)
    }
}
