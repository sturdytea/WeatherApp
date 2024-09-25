//
//
// CityInfoContainer.swift
// AstanaWeatherApp
//
// Created by sturdytea on 22.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct CityInfoContainer: View {
    @ObservedObject var weather: CurrentWeather
    
    init(weather: CurrentWeather) {
        self.weather = weather
    }
    
    var body: some View {
        VStack {
            Image(weather.icon)
                .resizable()
                .frame(width: 168, height: 168)
                .padding(.top, 16)
                .padding(EdgeInsets(top: 16, leading: 40, bottom: 26, trailing: 40))
            Text(weather.cityName)
                .font(.body)
                .padding(.bottom, 4)
            Text("\(Int(weather.temp))℃")
                .font(.largeTitle)
            Text(weather.main)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(8)
        }
        .padding(16)
        .background(Color.custom.primary)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}

#Preview {
    CityInfoContainer(weather: CurrentWeather(CurrentResponseBody(
        name: "Test City",
        dt: 0,
        weather: [WeatherResponse(id: 1, main: "Clear", icon: "cloud.sun")],
        main: MainResponse(temp: 300.0, pressure: 1012, humidity: 50),
        wind: WindResponse(speed: 5.0)
    )))
}
