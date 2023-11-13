//
//  GreetView.swift
//  Planner
//
//  Created by csuftitan on 11/9/23.
//
import SwiftUI

struct GreetView: View {
    // Instantiate the view model
    @StateObject var viewModel = GreetViewViewModel()

    var body: some View {
        ZStack {
            // Improved gradient background
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.3), .white]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)

            // Use VStack for better layout structure
            VStack {
                Spacer()
                
                Text("Calm Mind")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 50)
                
                // Conditionally display content based on the view model state
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                } else if let weather = viewModel.weather {
                    WeatherView(weather: weather)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .bold()
                }
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchWeatherData()
        }
    }
}

// Custom view to display weather information
struct WeatherView: View {
    var weather: Weather
    
    var body: some View {
        VStack {
            Image(systemName: weatherIcon(for: weather.weather.first?.icon))
                .font(.system(size: 70))
                .padding()
            
            Text(weather.weather.first?.description ?? "No Description")
                .font(.headline)
                .bold()
            
            Text(suggestion(for: weather.weather.first?.icon))
                .font(.title3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.5)))
                .padding(.top, 20)
        }
    }
    
    // Helper function to map icon codes to system image names
    func weatherIcon(for iconCode: String?) -> String {
        switch iconCode {
        case "01d": return "sun.max.fill"
        case "01n": return "moon.fill"
        case "02d": return "cloud.sun.fill"
        case "02n": return "cloud.moon.fill"
        case "03d": return "cloud.fill"
        case "03n": return "cloud.fill"
        case "11d": return "cloud.bolt.rain"
        case "09d": return "cloud.rain"
        case "10d": return "cloud.sun.rain"
        case "13d": return "snowflake"
        case "50d": return "cloud.fog.fill"
            
            // Add more cases for different weather conditions
        default: return "smoke.fill"
        }
    }
    
    func suggestion(for iconCode: String?) -> String {
        switch iconCode {
            case "01d": return "It's a sunny day, go to the pool!"
            case "01n": return "Clear night, perfect for stargazing."
            case "02d": return "Some clouds in the sky, but still a great day to be outside!"
            case "02n": return "Partly cloudy night, enjoy the cool breeze."
            case "03d", "03n": return "Overcast skies, a good day for indoor activities."
            case "11d": return "Thunderstorms expected, stay indoors and stay safe."
            case "09d": return "Drizzling... Remember to carry an umbrella!"
            case "10d": return "Rainy weather, perfect for a cup of coffee indoors."
            case "13d": return "Wrap up warm, it's snowing!"
            case "50d": return "Foggy conditions, drive carefully!"
            default: return "perfect for a museum visit or a relaxing read at home!"
            }
    }
}
struct GreetView_Previews: PreviewProvider {
    static var previews: some View {
        GreetView()
    }
}
