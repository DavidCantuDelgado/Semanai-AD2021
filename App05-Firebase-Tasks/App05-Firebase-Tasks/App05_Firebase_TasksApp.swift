//
//  App05_Firebase_TasksApp.swift
//  App05-Firebase-Tasks
//
//  Created by David Cantú Delgado on 28/10/21.
//

import SwiftUI
import Firebase

@main
struct App05_Firebase_TasksApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
