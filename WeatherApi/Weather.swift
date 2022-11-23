//
//  Weather.swift
//  WeatherApi
//
//  Created by Александр on 22.11.2022.
//

struct Weather: Decodable {
    let coordinate: Coordinate
    let main: Temperature
    let name: String
    let timezone: Int
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case main = "main"
        case name = "name"
        case timezone = "timezone"
    }
}
struct Coordinate: Decodable {
    let longitude: Double
    let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
struct Temperature: Decodable {
    let temperature: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
    }
}
