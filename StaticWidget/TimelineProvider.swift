//
//
// TimelineProvider.swift
// AstanaWeatherApp
//
// Created by sturdytea on 18.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: .now, city: "Astana", temp: -11, icon: "ClearSky", maxTemp: -11, minTemp: -11, wind: 7, feelsLike: -16)    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry = WeatherEntry(date: .now, city: "Astana", temp: -11, icon: "ClearSky", maxTemp: -11, minTemp: -11, wind: 7, feelsLike: -16)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WeatherEntry] = []
        
        if let userDefaults = UserDefaults(suiteName: "group.com.sturdytea.AstanaWeatherApp"),
           let city = userDefaults.string(forKey: "city"),
           let icon = userDefaults.string(forKey: "icon") {
            let currentDate = Date()
            let temp = userDefaults.integer(forKey: "currentTemp")
            let maxTemp = userDefaults.integer(forKey: "maxTemp")
            let minTemp = userDefaults.integer(forKey: "minTemp")
            let wind = userDefaults.integer(forKey: "wind")
            let feelsLike = userDefaults.integer(forKey: "feelsLike")
            
            // Generate a timeline consisting of three entries an hour apart, starting from the current date
            for hourOffset in 0 ..< 3 {
                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                let entry = WeatherEntry(date: entryDate, city: city, temp: temp, icon: icon, maxTemp: maxTemp, minTemp: minTemp, wind: wind, feelsLike: feelsLike)
                entries.append(entry)
            }
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
