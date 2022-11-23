//
//  NetworkManager.swift
//  WeatherApi
//
//  Created by Александр on 22.11.2022.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "invalid URL"
    case noData = "no data"
    case breakJSON = "break JSON"
    
}
let apiKey = "44c74389af1447803f1100d9796d41c1"
final class NetworkManager {
    static let shared = NetworkManager()
    private let locationManager = LocationManager.shared.locationManager.location?.coordinate
    
    func fetchWeather() async throws -> Weather {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(locationManager?.latitude ?? 0)&lon=\(locationManager?.longitude ?? 0)&appid=44c74389af1447803f1100d9796d41c1") else { throw NetworkError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        guard let weather = try? decoder.decode(Weather.self, from: data) else {
            throw NetworkError.breakJSON
        }
        return weather
    }
    private init() {}
}
