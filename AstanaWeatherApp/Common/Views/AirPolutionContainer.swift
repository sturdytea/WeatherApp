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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                CircularProgressView(progress: data.convertedAqi, value: data.aqi)
            }
            Divider()
                .frame(width: 16)
            VStack(alignment: .leading) {
                Text("\(LocalizedContent.aqi) - \(data.result)")
                    .padding(.bottom, 1)
                Text(LocalizedContent.aqiDescription)
                    .font(.primaryDescription)
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 16,  maxHeight: 90)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(.widgetBackground)
        .foregroundColor(.white)
        .font(.primaryTitle)
        .cornerRadius(20)
    }
}

