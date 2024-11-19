//
//
// WeatherError.swift
// AstanaWeatherApp
//
// Created by sturdytea on 28.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

enum WeatherError: Error {
    case network, parsing, fetching
    
    var description: String {
        switch self {
        case .network: "Network error"
        case .parsing: "Parsing error"
        case .fetching: "File fetching error"
        }
    }
}
