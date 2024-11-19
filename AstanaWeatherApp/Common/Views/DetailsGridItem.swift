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
    var value: String
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .opacity(0.7)
            Text(value)
                .font(.secondaryTitle)
            Text(name)
                .font(.primaryDescription)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    DetailsGridItem(imageName: "121", value: "Test", name: "121")
}
