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

final class WeatherViewModel: ObservableObject {
    private var weatherManager = WeatherManager()
    @Published var locationManager = LocationManager()
    @Published var forecastWeatherRecords: [ForecastWeather] = []
    @Published var hourlyWeatherRecords: [HourlyWeather] = []
    @Published var city = "Astana"
    @Published var currentWeatherRecord: CurrentWeather?
    @Published var airPolutionDataRecord: AirPolutionData?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        bindLocationUpdates()
    }
    
    private func bindLocationUpdates() {
        locationManager.$lastLocation
            .compactMap{ $0 }
            .sink { [weak self] coordinate in
                print("[WeatherViewModel] bindLocationUpdates(): lon: \(coordinate.longitude), lat: \(coordinate.latitude)")
                self?.fetchCurrentWeatherByCoordinates(lon: coordinate.longitude, lat: coordinate.latitude)
                self?.fetchHourlyWeatherByCoordinates(lon: coordinate.longitude, lat: coordinate.latitude)
                self?.fetchAirPolutionData(lon: coordinate.longitude, lat: coordinate.latitude)
            }
            .store(in: &subscriptions)
    }
    
    private func fetchCurrentWeatherByCityName() {
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
    
    private func fetchCurrentWeatherByCoordinates(lon: Double, lat: Double) {
        weatherManager.currentWeatherPublisher(lon: lon, lat: lat)
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
                self.saveCurrentWeatherToAppGroup(weather: value)
            })
            .store(in: &subscriptions)
    }
    
    private func fetchHourlyWeatherByCoordinates(lon: Double, lat: Double) {
        weatherManager.hourlyWeatherPublisher(lon: lon, lat: lat)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("fetchHourlyWeather(): Completion finished successfully")
                case .failure(let error):
                    print("Error: fetchHourlyWeather() \(error)")
                }
                
            }, receiveValue: { value in
                self.hourlyWeatherRecords.removeAll()
                let hourlyWeatherList = value.hourly
                    .map({ item in
                        HourlyWeather(item)
                    })
                self.hourlyWeatherRecords.append(contentsOf: hourlyWeatherList)
            })
            .store(in: &subscriptions)
    }
    
    private func fetchAirPolutionData(lon: Double, lat: Double) {
        weatherManager.airPolutionPublisher(lon: lon, lat: lat)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("fetchAirPolutionData(): Completion finished successfully")
                case .failure(let error):
                    print("Error: fetchAirPolutionData() \(error)")
                }
            }, receiveValue: { value in
                let recievedValue = value.list
                    .map(AirPolutionData.init)
                self.airPolutionDataRecord = recievedValue[0]
            })
            .store(in: &subscriptions)
    }
    
    private func saveCurrentWeatherToAppGroup(weather: CurrentWeather) {
        if let userDefaults = UserDefaults(suiteName: "group.com.sturdytea.AstanaWeatherApp") {
            userDefaults.set(weather.temp, forKey: "currentTemp")
            userDefaults.set(weather.cityName, forKey: "city")
            userDefaults.set(weather.icon, forKey: "icon")
            userDefaults.set(weather.maxTemp, forKey: "maxTemp")
            userDefaults.set(weather.minTemp, forKey: "minTemp")
            userDefaults.set(weather.wind, forKey: "wind")
            userDefaults.set(weather.feelsLike, forKey: "feelsLike")
        }
    }
}
