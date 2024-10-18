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

class ForecastWeather: ObservableObject, WeatherProtocol, Identifiable {
    let id = UUID()
    private let item: ListItemResponse
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
    
    var cityName: String
    
    var temp: Int {
        return Int(convertTemp(tempValue: item.main.temp, from: .kelvin, to: .celsius))

    }
    
    var main: String {
        return item.weather[0].main
    }
    
    var day: String {
        let currentDate = Date()
        let inputDate = Date(timeIntervalSince1970: TimeInterval(item.dt))
        let calendar = Calendar.current
        
        if calendar.isDate(inputDate, inSameDayAs: currentDate) {
                    return "Today"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: inputDate)
        }
    }
    
    init(_ item: ListItemResponse, cityName: String) {
        self.item = item
        self.cityName = cityName
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
