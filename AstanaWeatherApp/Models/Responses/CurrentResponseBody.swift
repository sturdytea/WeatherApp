//
//
// CurrentResponseBody.swift
// AstanaWeatherApp
//
// Created by sturdytea on 04.09.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct CurrentResponseBody: Decodable {
    let name: String // City name
    let dt: Int
    let weather: [WeatherResponse]
    let main: MainResponse
    let wind: WindResponse
}
