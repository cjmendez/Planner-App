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
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            InitialView()
        }
    }
}

