//
//
// StaticWidget.swift
// AstanaWeatherApp
//
// Created by sturdytea on 18.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import WidgetKit
import SwiftUI

struct StaticWidget: Widget {
    let kind: String = "StaticWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) { 
                StaticWidgetEntryView(entry: entry)
                    .containerBackground(.widgetBackground, for: .widget)
            } else {
                StaticWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Current Weather Widget")
        .description("Displays the weather information based on your location.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    StaticWidget()
} timeline: {
    WeatherEntry(date: .now, city: "Astana", temp: -11, icon: "ClearSky", maxTemp: -11, minTemp: -11, wind: 7, feelsLike: -16)
}
