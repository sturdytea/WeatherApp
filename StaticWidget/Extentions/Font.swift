//
//
// Font.swift
// AstanaWeatherApp
//
// Created by sturdytea on 18.11.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

extension Font {
    private static let fontName = "Montserrat"
    
    private enum Style: String {
        case light = "-Light"
        case regular = "-Regular"
        case semibold = "-SemiBold"
    }
    
    static let currentDegree = Font.custom("\(fontName)\(Style.semibold.rawValue)", size: 44)
    static let graphValueLarge = Font.custom("\(fontName)\(Style.semibold.rawValue)", size: 24)
    static let primaryTitle = Font.custom("\(fontName)\(Style.semibold.rawValue)", size: 16)
    static let primaryDescription = Font.custom("\(fontName)\(Style.light.rawValue)", size: 12)
    static let secondaryTitle = Font.custom("\(fontName)\(Style.regular.rawValue)", size: 14)
}
