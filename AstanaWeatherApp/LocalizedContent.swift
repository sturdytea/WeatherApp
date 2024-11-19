//
//
// LocalizedContent.swift
// AstanaWeatherApp
//
// Created by sturdytea on 18.11.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

enum LocalizedContent {
    // MARK: ContentView
    static let loading = "Loading data. Just a moment..."
    static let temperatureTitle = "Temperature"
    static let detailsTitle = "Detail Information"
    
    // MARK: AirPolutionContainer
    static let aqi = "AQI"
    static let aqiDescription = "The Air Quality Index (AQI) is used for reporting daily air quality."
    
    // MARK: WeatherDetailsContainer
    static let feelsLike = "Feels Like"
    static let rainPossibility = "Rain"
    static let humidity = "Humidity"
    static let windSpeed = "Wind"
    static let visibility = "Visibility"
    static let pressure = "Pressure"
    
    enum Symbol {
        static let celsius = "℃"
        static let degree = "°"
        static let percent = "%"
        static let dash = "-"
    }
    
    enum Metric {
        static let pressure = "hpa"
        static let visibility = "km"
        static let windSpeed = "km/h"
        static let rain = "mm/h"
    }
}
