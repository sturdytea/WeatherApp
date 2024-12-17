//
//
// SkeletonCellView.swift
// AstanaWeatherApp
//
// Created by sturdytea on 17.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct SkeletonCellView: View {
    
    var height: Double = 140
    var width: Double = (UIScreen.main.bounds.width - 16)
    
    var body: some View {
        HStack {
            Color.secondaryText
                .cornerRadius(20)
        }
        .frame(maxWidth: width, maxHeight: height)
        .blinking(duration: 0.75)
    }
}

#Preview {
    SkeletonCellView()
}
