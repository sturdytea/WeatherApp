//
//
// WeatherViewModel.swift
// AstanaWeatherApp
//
// Created by sturdytea on 20.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    var weatherManager = WeatherManager()
    @Published var forecastWeatherRecords: [ForecastWeather] = []
    @Published var city = "Astana"
    @Published var currentWeatherRecord: CurrentWeather?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        fetchCurrentWeather()
        fetchForecastWeather()
    }
    
    func fetchCurrentWeather() {
        weatherManager.currentWeatherPublisher(name: city)
            .map(CurrentWeather.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("fetchCurrentWeather(): Completion finished successfully")
                case .failure(let error):
                    print("Error: fetchCurrentWeather() \(error)")
                }
            }, receiveValue: { value in
                self.currentWeatherRecord = value
            })
            .store(in: &subscriptions)
    }
    
    func fetchForecastWeather() {
        weatherManager.forecastWeatherPublisher(name: city)
            .map(ForecastWeather.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("fetchForecastWeather(): Completion finished successfully")
                case .failure(let error):
                    print("Error: fetchForecastWeather() \(error)")
                }
            }, receiveValue: { value in
                self.forecastWeatherRecords.append(value)
            })
            .store(in: &subscriptions)
    }
}
