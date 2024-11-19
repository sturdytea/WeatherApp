//
//
// AirPolutionData.swift
// AstanaWeatherApp
//
// Created by sturdytea on 29.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

final class AirPolutionData: ObservableObject {
    private let item: AQIListItemResponse
    private var subscriptions = Set<AnyCancellable>()
    
    var result = ""
    
    var aqi: Int { item.main.aqi }
    
    var convertedAqi: CGFloat {
        var index: CGFloat
        switch item.main.aqi {
        case 1:
            result = "Good"
            index = 0.1
        case 2:
            result = "Fair"
            index = 0.25
        case 3:
            result = "Moderate"
            index = 0.5
        case 4:
            result = "Poor"
            index = 0.75
        case 5:
            result = "Very Poor"
            index = 0.83
        default:
            result = "No data"
            index = 0.0

        }
        return index
    }
    
    var co: Int { Int(item.components.co) }
    
    var no: Int { Int(item.components.no) }
    
    var no2: Int { Int(item.components.no2) }
    
    var o3: Int { Int(item.components.o3) }
    
    var so2: Int { Int(item.components.so2) }
    
    var pm2_5: Int { Int(item.components.pm2_5) }
    
    var pm10: Int { Int(item.components.pm10) }
    
    var nh3: Int { Int(item.components.nh3) }
    
    init(_ item: AQIListItemResponse) {
        self.item = item
    }
}
