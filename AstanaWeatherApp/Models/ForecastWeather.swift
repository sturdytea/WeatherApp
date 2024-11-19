//
//
// ForecastWeather.swift
// AstanaWeatherApp
//
// Created by sturdytea on 10.09.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

final class ForecastWeather: ObservableObject, WeatherProtocol {
    private let item: ListItemResponse
    private var subscriptions = Set<AnyCancellable>()
    private lazy var formatter = DateFormatter()
    private lazy var calendar = Calendar.current
    private lazy var currentDate = Date()
    private lazy var inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
    
    var year: String {
        formatter.dateFormat = "yyyy"
        return formatter.string(from: inputDate)
    }
    
    var date: String {
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
    
    var icon: String {
        guard !item.weather[0].icon.isEmpty else { return "ClearSky" }
        
        switch item.weather[0].icon {
        case "01d", "01n":
            return "ClearSky"
        case "02d", "02n":
            return "FewClouds"
        case "03d", "03n":
            return "ScatteredClouds"
        case "04d", "04n":
            return "BrokenClouds"
        case "09d", "09n":
            return "ShowerRain"
        case "10d", "10n":
            return "rain"
        case "11d", "11n":
            return "Thunderstorm"
        case "13d", "13n":
            return "Snow"
        case "50d", "50n":
            return "Mist"
        default:
            return "ClearSky"
        }
    }
    
    var temp: Int {
        Int(convertTemp(tempValue: item.main.temp, from: .kelvin, to: .celsius))

    }
    
    var main: String {
        item.weather[0].main
    }
    
    init(_ item: ListItemResponse) {
        self.item = item
    }
    
    private func convertTemp(tempValue: Double, from inputType: UnitTemperature, to outputType: UnitTemperature) -> Double {
        lazy var formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        formatter.unitOptions = .providedUnit
        let input = Measurement(value: tempValue, unit: inputType)
        let output = input.converted(to: outputType)
        return output.value
    }
}
