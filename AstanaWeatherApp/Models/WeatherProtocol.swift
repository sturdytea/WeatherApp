//
//
// WeatherProtocol.swift
// AstanaWeatherApp
//
// Created by sturdytea on 11.09.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

protocol WeatherProtocol {
    var icon: String { get }
    var cityName: String { get }
    var temp: String { get }
    var maxTemp: String { get }
    var minTemp: String { get }
    var main: String { get }
    var date: String { get }
    var year: String { get }
}
