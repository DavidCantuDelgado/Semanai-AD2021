//
//  TaskDetailView.swift
//  App05-Firebase-Tasks
//
//  Created by David Cantú Delgado on 28/10/21.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var taskModel: TaskModel
    var task: Task
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), task: Task.dummy)
    }
}
