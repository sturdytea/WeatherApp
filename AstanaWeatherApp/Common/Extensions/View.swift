//
//
// View.swift
// AstanaWeatherApp
//
// Created by sturdytea on 17.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

extension View {
    func blinking(duration: Double = 1) -> some View {
        modifier(BlinkViewModifier(duration: duration))
    }    
}
