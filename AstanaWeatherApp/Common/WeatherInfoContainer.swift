//
//
// WeatherInfoContainer.swift
// AstanaWeatherApp
//
// Created by sturdytea on 15.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct WeatherInfoContainer: View {
    var weekDay: String
    var main: String
    var iconName: String
    var iconColor: Color = .white
    var temp: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(weekDay)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(EdgeInsets(top: 26, leading: 0, bottom: 16, trailing: 0))
                Text(main)
                    .padding(.top, 8)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.top, 16)
                    .foregroundColor(iconColor)
                Text("\(Int(temp))℃")
                    .padding(.top, 8)
            }
        }
        .padding(16)
        .background(Color.custom.primary)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}

#Preview {
    WeatherInfoContainer(weekDay: "Today", main: "Sunny", iconName: "sun.max", temp: 20)
}
