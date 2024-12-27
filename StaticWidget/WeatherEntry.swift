//
//
// WeatherEntry.swift
// AstanaWeatherApp
//
// Created by sturdytea on 18.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import WidgetKit

struct WeatherEntry: TimelineEntry {
    let date: Date
    let city: String
    let temp: Int
    let icon: String
    let maxTemp: Int
    let minTemp: Int
    let wind: Int
    let feelsLike: Int
}
