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
    var temp: Int { get }
    var main: String { get }
}
