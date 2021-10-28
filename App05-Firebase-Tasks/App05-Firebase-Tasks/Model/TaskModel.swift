//
//  TaskModel.swift
//  App05-Firebase-Tasks
//
//  Created by David Cantú Delgado on 28/10/21.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject {
    
    @Published var tasks = [Task]()
    @Published var categories = [Category]()
    @Published var priorities = [Priority]()
    
    private let db = Firestore.firestore()
    
    init() {
        fetchTasks()
        fetchCategories()
        fetchPriorities()
    }
    
    func fetchTasks() {
        
        db.collection("Tasks").order(by: "due_date").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in
                    return try? queryDocumentSnapshot.data(as: Task.self)
                }
            }
    }
    
    func fetchCategories() {
        
        db.collection("Category").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.categories = documents.compactMap { queryDocumentSnapshot -> Category? in
                    return try? queryDocumentSnapshot.data(as: Category.self)
                }
            }
    }
    
    func fetchPriorities() {
        
        db.collection("Priority").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.priorities = documents.compactMap { queryDocumentSnapshot -> Priority? in
                    return try? queryDocumentSnapshot.data(as: Priority.self)
                }
            }
    }
}
