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
    
    func bindLocationUpdates() {
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
    
    func fetchCurrentWeatherByCityName() {
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
    
    func fetchCurrentWeatherByCoordinates(lon: Double, lat: Double) {
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
    
    func fetchHourlyWeatherByCoordinates(lon: Double, lat: Double) {
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
    
    func fetchAirPolutionData(lon: Double, lat: Double) {
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
}
