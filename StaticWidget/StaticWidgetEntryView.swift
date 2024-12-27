//
//
// StaticWidgetEntryView.swift
// AstanaWeatherApp
//
// Created by sturdytea on 18.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI
import WidgetKit

struct StaticWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(entry.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                
                Text("\(entry.temp)\(LocalizedContent.Symbol.celsius)")
                    .font(.graphValueLarge)
                
                Text(entry.city)
                    .font(.secondaryTitle)
                Spacer()
                
                HStack(spacing: 2) {
                    Text("H: \(entry.maxTemp)\(LocalizedContent.Symbol.degree)")
                        .font(.primaryDescription)
                    Text("L: \(entry.minTemp)\(LocalizedContent.Symbol.degree)")
                        .font(.primaryDescription)
                }
                .opacity(0.6)
                
                HStack(spacing: 2) {
                    Image("Temperature")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                    Text("\(entry.feelsLike)\(LocalizedContent.Symbol.celsius)")
                        .font(.primaryDescription)
                    Spacer()
                    Image("Wind")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                    Text("\(entry.wind)\(LocalizedContent.Metric.windSpeed)")
                        .font(.primaryDescription)
                    Spacer()
                }
                .opacity(0.6)
            }
            Spacer()
        }
        .foregroundStyle(.primaryText)
    }
}

#Preview(as: .systemSmall) {
    StaticWidget()
} timeline: {
    WeatherEntry(date: .now, city: "Astana", temp: -11, icon: "ClearSky", maxTemp: -11, minTemp: -11, wind: 7, feelsLike: -16)
}
