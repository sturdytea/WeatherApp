//
//
// DetailsView.swift
// AstanaWeatherApp
//
// Created by sturdytea on 21.08.2024.
//
// GitHub: https://github.com/sturdytea
//
    

//import SwiftUI
//
//struct DetailsView: View {
//    
//    var array: [CurrentWeather] = Array(repeating: CurrentWeather(), count: 3)
//    
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(array) { weather in
//                    CityInfoContainer(weather: weather)
//                        .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
//                        .scrollTransition { content, phase in
//                            content
//                                .opacity(phase.isIdentity ? 1 : 0.5)
//                                .scaleEffect(x: phase.isIdentity ? 1 : 0.8)
//                                .offset(y: phase.isIdentity ? 0 : 60)
//                        }
//                }
//            }
//        }
//        .contentMargins(30, for: .scrollContent)
//        .scrollTargetBehavior(.paging)
//        .scrollIndicators(.hidden)
//    }
//}
//
//#Preview {
//    DetailsView()
//}
