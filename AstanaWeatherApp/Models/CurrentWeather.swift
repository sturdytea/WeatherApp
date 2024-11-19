//
//
// CurrentWeather.swift
// AstanaWeatherApp
//
// Created by sturdytea on 04.09.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

final class CurrentWeather: ObservableObject, WeatherProtocol {
    private let item: CurrentResponseBody
    private var subscriptions = Set<AnyCancellable>()
    private lazy var formatter = DateFormatter()
    private lazy var inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
    
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
            return "Rain"
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
    
    var cityName: String { item.name }
    
    var temp: Int {
        Int(convertTemp(tempValue: item.main.temp, from: .kelvin, to: .celsius))
    }
    
    var maxTemp: Int {
        Int(convertTemp(tempValue: item.main.temp_max, from: .kelvin, to: .celsius))
    }
    
    var minTemp: Int {
        Int(convertTemp(tempValue: item.main.temp_min, from: .kelvin, to: .celsius))
    }
    
    var feelsLike: Int {
        Int(convertTemp(tempValue: item.main.feels_like, from: .kelvin, to: .celsius))
    }
    
    var main: String { item.weather[0].main }
    
    var date: String {
        formatter.dateFormat = "EEEE, dd MMM"
        return formatter.string(from: inputDate)
    }
    
    var year: String {
        formatter.dateFormat = "yyyy"
        return formatter.string(from: inputDate)
    }
    
    var rain: Double? {
        item.rain?.h
    }
    
    var pressure: Int {
        item.main.pressure
    }
    
    var visibility: Int {
        item.visibility / 1000
    }
    
    var wind: Int {
        Int(item.wind.speed)
    }
    
    var humidity: Int {
        item.main.humidity
    }
    
    init(_ response: CurrentResponseBody) {
        self.item = response
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
