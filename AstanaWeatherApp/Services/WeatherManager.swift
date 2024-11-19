//
//
// WeatherManager.swift
// AstanaWeatherApp
//
// Created by sturdytea on 20.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

final class WeatherManager {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API Key"
    private let session: URLSession
    private var subscriptions = Set<AnyCancellable>()
    private let base = "https://api.openweathermap.org/data/"
    private lazy var decoder = JSONDecoder()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // TODO: Refactor
    // MARK: Downloading current weather of the city from api server
    func currentWeatherPublisher(name: String) -> AnyPublisher<CurrentResponseBody, Error> {
        guard let url = URL(string: "\(base)2.5/weather?q=\(name)&appid=\(apiKey)") else {
            return Fail(error: WeatherError.network).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CurrentResponseBody.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func currentWeatherPublisher(lon: Double, lat: Double) -> AnyPublisher<CurrentResponseBody, Error> {
        guard let url = URL(string: "\(base)2.5/weather?lon=\(lon)&lat=\(lat)&appid=\(apiKey)") else {
            return Fail(error: WeatherError.network).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CurrentResponseBody.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func forecastWeatherPublisher(name: String) -> AnyPublisher<ForecastResponseBody, Error> {
        guard let url = URL(string: "\(base)2.5/forecast?q=\(name)&cnt=5&appid=\(apiKey)") else {
            return Fail(error: WeatherError.network).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ForecastResponseBody.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func hourlyWeatherPublisher(lon: Double, lat: Double) -> AnyPublisher<HourlyResponseBody, Error> {
        guard let url = URL(string: "\(base)3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,daily,alerts&appid=\(apiKey)") else {
            return Fail(error: WeatherError.network).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: HourlyResponseBody.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func airPolutionPublisher(lon: Double, lat: Double) -> AnyPublisher<AirPolutionResponseBody, Error> {
        guard let url = URL(string: "\(base)2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {
            return Fail(error: WeatherError.network).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: AirPolutionResponseBody.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
