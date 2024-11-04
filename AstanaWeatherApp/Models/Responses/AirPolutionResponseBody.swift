//
//
// AirPolutionResponseBody.swift
// AstanaWeatherApp
//
// Created by sturdytea on 29.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct AirPolutionResponseBody: Decodable {
    let list: [AQIListItemResponse]
}

struct AQIListItemResponse: Decodable {
    let main: AQIMainResponse
    let components: AQIComponentsResponse
}

struct AQIMainResponse: Decodable {
    let aqi: Int
}

struct AQIComponentsResponse: Decodable {
    let co: Double
    let no: Double
    let no2: Double
    let o3: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let nh3: Double
}
