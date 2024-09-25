//
//
// ForecastResponseBody.swift
// AstanaWeatherApp
//
// Created by sturdytea on 10.09.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct ForecastResponseBody: Decodable {
    let city: CityResponse
    let list: [ListItemResponse]
}

struct CityResponse: Decodable {
    let name: String
}

struct ListItemResponse: Decodable {
    let dt: Int
    let main: MainResponse
    let weather: [WeatherResponse]
    let wind: WindResponse
}

struct TemperatureResponse: Decodable {
    let day: Double 
}
