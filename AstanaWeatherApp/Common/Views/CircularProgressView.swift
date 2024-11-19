//
//
// CircularProgressView.swift
// AstanaWeatherApp
//
// Created by sturdytea on 30.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct CircularProgressView: View {
    let progress: CGFloat
    let value: Int
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.83)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(.white)
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .animation(.linear, value: progress)
            }
            .rotationEffect(Angle(degrees: 120))
            Text("\(value)")
                .rotationEffect(Angle(degrees: 0))
                .font(.graphValueLarge)
                
        }
        .frame(width: UIScreen.main.bounds.width / 6)
        
        .foregroundStyle(.accent)
    }
}

#Preview {
    CircularProgressView(progress: CGFloat(0.5), value: 3)
}
