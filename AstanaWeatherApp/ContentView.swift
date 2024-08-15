//
//
// ContentView.swift
// AstanaWeatherApp
//
// Created by sturdytea on 15.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct ContentView: View {
    
    var cityName = "Astana"
    var sectionOneTitle = "Forecast for 5 days"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cityName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    print("Button tapped")
                }) {
                    Image(systemName: "square.grid.2x2")
                        .resizable()
                        .frame(width: 24, height: 24)
                        
                }
                .frame(width: 50, height: 50)
                .background(Color.custom.primary)
                .cornerRadius(100)
                .foregroundColor(.white)
            }
            WeatherInfoContainer(weekDay: "Today", main: "Sunny", iconName: "sun.max", temp: 20)
            Spacer()
            Text(sectionOneTitle)
                .padding(EdgeInsets(top: 26, leading: 0, bottom: 0, trailing: 0))
                .font(.title3)
                .fontWeight(.bold)
            List {
                WeatherInfoContainer(weekDay: "Monday", main: "Clear", iconName: "cloud.rain.fill", temp: 6)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                WeatherInfoContainer(weekDay: "Tuesday", main: "Sunny", iconName: "sun.max", temp: 5)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                WeatherInfoContainer(weekDay: "Wednesday", main: "Cloudy", iconName: "snowflake", temp: -4)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                WeatherInfoContainer(weekDay: "Thursday", main: "Cloudy", iconName: "snowflake", temp: 1)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                WeatherInfoContainer(weekDay: "Wednesday", main: "Sunny", iconName: "sun.max", temp: 16)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
