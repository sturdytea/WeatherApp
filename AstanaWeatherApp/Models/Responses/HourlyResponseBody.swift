//
//
// HourlyResponseBody.swift
// AstanaWeatherApp
//
// Created by sturdytea on 29.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct HourlyResponseBody: Decodable {
    let hourly: [HourWeatherResponse]
}

struct HourWeatherResponse: Decodable {
    let dt: Int
    let temp: Double
    let weather: [WeatherResponse]
}
