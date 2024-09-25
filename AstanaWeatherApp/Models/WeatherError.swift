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
        case .network:
            return "Network error"
        case .parsing:
            return "Parsing error"
        case .fetching:
            return "File fetching error"
        }
    }
}
