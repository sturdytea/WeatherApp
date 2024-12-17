//
//
// BlinkViewModifier.swift
// AstanaWeatherApp
//
// Created by sturdytea on 17.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct BlinkViewModifier: ViewModifier {
    let duration: Double
    @State private var blinking: Bool = false
    
    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0.3 : 1)
            .onAppear {
                withAnimation(
                    .linear(duration: 1)
                    .repeatForever(autoreverses: true)

                ) {
                    blinking.toggle()
                }
            }
           
            
    }    
}
