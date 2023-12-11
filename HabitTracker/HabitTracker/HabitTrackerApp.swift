//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Cynthia Zepeda on 12/8/23.
//

import SwiftUI

@main
struct Habit_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
