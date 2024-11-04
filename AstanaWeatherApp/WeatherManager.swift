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

class WeatherManager {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API Key"
    private let session: URLSession
    var subscriptions = Set<AnyCancellable>()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: Downloading current weather of the city from api server
    func currentWeatherPublisher(name: String) -> AnyPublisher<CurrentResponseBody, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(name)&appid=\(apiKey)") else {
            fatalError("Missing URL") // TODO: Handle as WeatherError
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CurrentResponseBody.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func forecastWeatherPublisher(name: String) -> AnyPublisher<ForecastResponseBody, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(name)&cnt=5&appid=\(apiKey)") else {
            fatalError("Missing URL") // TODO: Handle as WeatherError
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ForecastResponseBody.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func hourlyWeatherPublisher(lon: Double = 71.446, lat: Double = 51.1801) -> AnyPublisher<HourlyResponseBody, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,daily,alerts&appid=\(apiKey)") else {
            fatalError("Missing URL")
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: HourlyResponseBody.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func airPolutionPublisher(lon: Double = 71.446, lat: Double = 51.1801) -> AnyPublisher<AirPolutionResponseBody, Error> {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {
            fatalError("Missing URL")
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: AirPolutionResponseBody.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
