//
//  WeatherManager.swift
//  Planner
//
//  Created by csuftitan on 11/9/23.
//

import Foundation


struct Weather: Decodable {
    let coord: Coordinate
    let weather: [WeatherCondition]
    let main: WeatherMain
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: System
    let timezone: Int
    let id: Int
    let name: String
}
struct WeatherCondition: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Coordinate: Decodable {
    let lon: Double
    let lat: Double
}

struct WeatherMain: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

struct Clouds: Decodable {
    let all: Int
}

struct System: Decodable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

class WeatherService {
    func fetchWeather(completion: @escaping (Result<Weather, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=33.89&lon=-117.9&appid=e65177295645c6e991e63ac2a072f30b"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let printdata = data, let rawJSON = String(data: printdata, encoding: .utf8) {
                print("Raw JSON:", rawJSON)
            }
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }

            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(weather))
            } catch {
                print("JSON Decoding Error: \(error)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
