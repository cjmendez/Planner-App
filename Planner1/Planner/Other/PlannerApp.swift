//
//  PlannerApp.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//
import FirebaseCore
import SwiftUI

@main
struct PlannerApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                InitialView()
                    .tabItem {
                        Text("Initial")
                    }
                
                ContentView()
                    .modelContainer(for: Task.self)
                    .tabItem {
                        Text("Task Management")
                    }
            }
        }
    }
}

//struct Task_ManagementApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(for: Task.self)
//    }
//}

