//
//  MainView.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if !viewModel.currentuserId.isEmpty && viewModel.isSignedIn{
            accountView
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
    TabView {
        TodolistView(userId: viewModel.currentuserId)
            .tabItem {
                Label("Home", systemImage: "house")
            }
        ProfileView()
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
    }
}
}

#Preview {
    MainView()
}
