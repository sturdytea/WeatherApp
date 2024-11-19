//
//
// LocationManager.swift
// AstanaWeatherApp
//
// Created by sturdytea on 06.11.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var lastLocation: CLLocationCoordinate2D?
    private lazy var manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 1000
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthoriation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        DispatchQueue.main.async {
            self.lastLocation = locations.first?.coordinate
        }
    }
    
    func checkLocationAuthoriation() {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            startUpdatingLocation()
            print("[LocationManager] checkLocationAuthoriation(): Location authorized")
        case .restricted, .denied:
            print("[LocationManager] checkLocationAuthoriation(): Location restricted or denied")
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            print("[LocationManager] checkLocationAuthoriation(): Location service disabled")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }
}
