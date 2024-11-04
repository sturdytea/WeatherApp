//
//
// DetailsGridItem.swift
// AstanaWeatherApp
//
// Created by sturdytea on 30.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct DetailsGridItem: View {
    var imageName: String
    var name: String
    var value: String
    
    init(_ imageName: String, value: String, _ name: String) {
        self.imageName = imageName
        self.value = value
        self.name = name
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .opacity(0.7)
            Text(value)
                .font(.custom("Montserrat-Regular", size: 12))
            Text(name)
                .font(.custom("Montserrat-Light", size: 10))
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    DetailsGridItem("121", value: "121", "Test")
}
