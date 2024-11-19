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

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 90))
        ], spacing: 20) {
            DetailsGridItem(imageName: "Temperature", value: "\(weather.feelsLike)\(LocalizedContent.Symbol.celsius)", name: LocalizedContent.feelsLike)
            DetailsGridItem(imageName: "RainPossibility", value: weather.rain != nil ? "\(String(describing: weather.rain))\(LocalizedContent.Metric.rain)" : "\(LocalizedContent.Symbol.dash)", name: LocalizedContent.rainPossibility)
            DetailsGridItem(imageName: "Humidity", value: "\(weather.humidity)\(LocalizedContent.Symbol.percent)", name: LocalizedContent.humidity)
            DetailsGridItem(imageName: "Wind", value: "\(weather.wind)\(LocalizedContent.Metric.windSpeed)", name: LocalizedContent.windSpeed)
            DetailsGridItem(imageName: "Visibility", value: "\(weather.visibility)\(LocalizedContent.Metric.visibility)", name: LocalizedContent.visibility)
            DetailsGridItem(imageName: "Pressure", value: "\(weather.pressure)\(LocalizedContent.Metric.pressure)", name: LocalizedContent.pressure)
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 16, maxHeight: 130)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.primaryTitle)
        .cornerRadius(20)
    }
}
