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

class CurrentWeather: ObservableObject, WeatherProtocol {
    private let item: CurrentResponseBody
    private let formatter = DateFormatter()
    var subscriptions = Set<AnyCancellable>()
    
    var icon: String {
        switch item.weather[0].icon {
        case "01d", "01n":
            return "clear_sky"
        case "02d", "02n":
            return "few_clouds"
        case "03d", "03n":
            return "scattered_clouds"
        case "04d", "04n":
            return "broken_clouds"
        case "09d", "09n":
            return "shower_rain"
        case "10d", "10n":
            return "rain"
        case "11d", "11n":
            return "thunderstorm"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "mist"
        default:
            return "clear_sky"
        }
    }
    
    var cityName: String {
        return item.name
    }
    
    var temp: String {
        let temp = Int(convertTemp(tempValue: item.main.temp, from: .kelvin, to: .celsius))
        return "\(temp)℃"
    }
    
    var maxTemp: String {
        let temp = Int(convertTemp(tempValue: item.main.temp_max, from: .kelvin, to: .celsius))
        return "\(temp)°"
    }
    
    var minTemp: String {
        let temp = Int(convertTemp(tempValue: item.main.temp_min, from: .kelvin, to: .celsius))
        return "\(temp)°"
    }
    
    var feelsLike: String {
        let temp = Int(convertTemp(tempValue: item.main.feels_like, from: .kelvin, to: .celsius))
        return "\(temp)℃"
    }
    
    var main: String {
        return item.weather[0].main
    }
    
    var date: String {
        let inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
        formatter.dateFormat = "EEEE, dd MMM"
        return formatter.string(from: inputDate)
    }
    
    var year: String {
        let inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
        formatter.dateFormat = "yyyy"
        return formatter.string(from: inputDate)
    }
    
    var rain: String {
        var precipitation = ""
        if item.rain?.h != nil {
            precipitation = "\(String(describing: item.rain?.h))mm/h"
        } else {
            return "-"
        }
        return precipitation
    }
    
    var pressure: String {
        let pressure = item.main.pressure
        return "\(pressure)hpa"
    }
    
    var visibility: String {
        let visibility = item.visibility / 1000
        return "\(visibility)km"
    }
    
    var wind: String {
        let wind = item.wind.speed
        return "\(wind)km/h"
    }
    
    var humidity: String {
        let humidity = item.main.humidity
        return "\(humidity)%"
    }
    
    init(_ response: CurrentResponseBody) {
        self.item = response
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
