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

var apiKey = "5ae854b2f4529bd064746c2e49aa257a"

class WeatherManager {
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
}
