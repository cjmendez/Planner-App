//
//  GreetViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/9/23.
//

// GreetViewModel.swift
import Foundation

class WeatherAPIManager {
    
    func fetchWeather(completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let urlString = "YOUR_API_ENDPOINT"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
