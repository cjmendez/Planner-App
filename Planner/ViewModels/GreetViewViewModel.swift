//
//  GreetViewViewModel.swift
//  Planner
//
//  Created by csuftitan on 11/10/23.
//

import Foundation

class GreetViewViewModel: ObservableObject {
    // Add an instance of the WeatherService
    private var weatherService = WeatherService()

    // Published properties that the view can bind to
    @Published var system: System?
    @Published var weather: Weather?
    @Published var isLoading = false
    @Published var errorMessage: String?

    // Function to fetch weather data
    func fetchWeatherData() {
        isLoading = true
        weatherService.fetchWeather { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let weatherData):
                    self?.weather = weatherData
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
