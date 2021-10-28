//
//  ContentView.swift
//  App05-Firebase-Tasks
//
//  Created by David Cantú Delgado on 28/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var taskModel = TaskModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(taskModel.priorities) { priority in
                        VStack {
                            Text(priority.priority)
                            Image(systemName: priority.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .navigationBarTitle("Tareas")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
