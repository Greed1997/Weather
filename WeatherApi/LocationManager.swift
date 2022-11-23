//
//  LocationManager.swift
//  WeatherApi
//
//  Created by Александр on 23.11.2022.
//

import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        configurate()
    }
    
    private func configurate() {
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func start() {
        setActiveMode(true)
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    private func setActiveMode(_ value: Bool) {
        if value {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.distanceFilter = 10
        } else {
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.distanceFilter = CLLocationDistanceMax
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userDefaults = UserDefaults.standard
        let key = "location"
        let count = userDefaults.integer(forKey: key) + 1
        userDefaults.set(count, forKey: key)
        userDefaults.synchronize()
        print("didUpdateLocations #\(count)")
    }
}
