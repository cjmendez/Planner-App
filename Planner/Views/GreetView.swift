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
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.accent, .white]), startPoint:.bottom, endPoint: .top)
            Text("Calm Mind")
                .foregroundStyle(.black)
                .font(.system(size: 80))
                .bold()
                .offset(y: -250)
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                }else if let weather = viewModel.weather {
                    // Display the fetched weather data
                    HStack{
                        if weather.weather.first?.icon == "01n"{
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"sun.max.fill")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "01d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"sun.max.fill")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "11d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"cloud.bolt.rain")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "09d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"cloud.rain")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "10d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"cloud.sun.rain")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "13d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"snowflake")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "50d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"cloud.fog.fill")
                                .font(.system(size: 90))
                        }else if weather.weather.first?.icon == "50d" {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"cloud.fog.fill")
                                .font(.system(size: 90))
                        }else {
                            Label(weather.weather.first?.main ?? "No Description", systemImage:"cloud")
                                .font(.system(size: 70))
                        }
                    }
                    .padding()
                    Text(weather.weather.first?.description ?? "No Description")
                        .bold()
                }
                    
                 else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                }
            }

        }
        .onAppear {
            viewModel.fetchWeatherData()
        }
    }
}


#Preview {
    GreetView()
}
