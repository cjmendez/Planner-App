//
//  ContentView.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if !viewModel.currentuserId.isEmpty && viewModel.isSignedIn{
            TabView {
                TodolistView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
