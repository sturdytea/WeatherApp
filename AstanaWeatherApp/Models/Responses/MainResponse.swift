//
//
// MainResponse.swift
// AstanaWeatherApp
//
// Created by sturdytea on 10.09.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct MainResponse: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}
