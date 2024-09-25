//
//
// WeatherResponse.swift
// AstanaWeatherApp
//
// Created by sturdytea on 20.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct WeatherResponse: Decodable {
    let id: Int
    let main: String
    let icon: String
}
