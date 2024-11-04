//
//
// AirPolutionContainer.swift
// AstanaWeatherApp
//
// Created by sturdytea on 29.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct AirPolutionContainer: View {
    let data: AirPolutionData
    
    init(_ data: AirPolutionData) {
        self.data = data
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                CircularProgressView(data.aqi, data.convertedAqi)
            }
            Divider()
                .frame(width: 16)
            VStack(alignment: .leading) {
                Text("AQI - \(data.result)")
                    .padding(.bottom, 1)
                Text("The Air Quality Index (AQI) is used for reporting daily air quality.")
                    .font(.custom("Montserrat-Light", size: 12))
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 16,  maxHeight: 90)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.custom("Montserrat-SemiBold", size: 16))
        .cornerRadius(20)
    }
}

