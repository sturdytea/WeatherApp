//
//
// HourlyWeather.swift
// AstanaWeatherApp
//
// Created by sturdytea on 29.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

final class HourlyWeather: ObservableObject, Identifiable {
    let id = UUID()
    private let item: HourWeatherResponse
    private let formatter = DateFormatter()
    var subscriptions = Set<AnyCancellable>()
    
    var icon: String {
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
    
    var date: String {
        let inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
    
    var time: String {
        let inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: inputDate)
    }
    
    var temp: Int {
        return Int(convertTemp(tempValue: item.temp, from: .kelvin, to: .celsius))
    }
    
    init(_ item: HourWeatherResponse) {
        self.item = item
    }
    
    private func convertTemp(tempValue: Double, from inputType: UnitTemperature, to outputType: UnitTemperature) -> Double {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        formatter.unitOptions = .providedUnit
        let input = Measurement(value: tempValue, unit: inputType)
        let output = input.converted(to: outputType)
        return output.value
    }
}
