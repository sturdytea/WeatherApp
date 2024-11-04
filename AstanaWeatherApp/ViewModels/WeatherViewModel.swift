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
    @Published var hourlyWeatherRecords: [HourlyWeather] = []
    @Published var city = "Astana"
    @Published var currentWeatherRecord: CurrentWeather?
    @Published var airPolutionDataRecord: AirPolutionData?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        fetchCurrentWeather()
        fetchHourlyWeather()
        fetchAirPolutionData()
//        fetchForecastWeather()
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
    
//    func fetchForecastWeather() {
//        weatherManager.forecastWeatherPublisher(name: city)
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    print("fetchForecastWeather(): Completion finished successfully")
//                    print("Completion \(completion)")
//                case .failure(let error):
//                    print("Error: fetchForecastWeather() \(error)")
//                }
//            }, receiveValue: { value in
//                self.forecastWeatherRecords.removeAll()
//                let cityName = value.city.name
//                let forecastWeatherList = value.list.map { item in
//                    ForecastWeather(item, cityName: cityName)
//                }
//                self.forecastWeatherRecords.append(contentsOf: forecastWeatherList)
//            })
//            .store(in: &subscriptions)
//    }
    
    func fetchHourlyWeather() {
        weatherManager.hourlyWeatherPublisher()
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
    
    func fetchAirPolutionData() {
        weatherManager.airPolutionPublisher()
//            .map(AirPolutionData.init)
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
//                print("fetchAirPolutionData(): \(self.airPolutionDataRecord?.aqi)")
//                self.airPolutionDataRecord = value
            })
            .store(in: &subscriptions)
    }
}
