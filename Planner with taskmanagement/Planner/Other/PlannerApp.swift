//
//  PlannerApp.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//
import SwiftUI
import FirebaseCore

@main
struct PlannerApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            InitialView()  // 使用 InitialView 作为启动视图
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

