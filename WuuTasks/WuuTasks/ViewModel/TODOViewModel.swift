//
//  TODOViewModel.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/23/22.
//

import SwiftUI
import Firebase

class TODOViewModel: ObservableObject {
    
    @Published var todos = [TODO]()
    @Published var showCreateTODOView: Bool = false
    @Published var filterTODOSelected: SelectedButton = .all
    @Published var todosFiltered = [TODO]()
    
    init() {
        loadTODOs()
    }
    
    func loadTODOs() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let query = COLLECTIONS_USERS.document(user.id ?? "").collection("to-dos").order(by: "completed", descending: false)
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            self.todos = documents.compactMap({ try? $0.data(as: TODO.self) })
            
            for index in stride(from: 0, to: self.todos.count, by: 1) {
                self.todos[index].documentID = documents[index].documentID
            }
            self.todosFiltered = self.todos
            
            if self.filterTODOSelected != .all {
                self.todosFiltered = self.todos.filter{ todo in
                    return todo.TODOType == self.filterTODOSelected.rawValue
                }
            } else {
                self.todosFiltered = self.todos
            }
            
        }
    }
    
    func uploadTODO(todo: TODO) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data: [String: Any] = ["title": todo.title,
                                   "description": todo.description,
                                   "TODOType": todo.TODOType,
                                   "completed": todo.completed,
                                   "ownerUid": todo.id ?? ""]
        
        COLLECTIONS_USERS.document(user.id ?? "").collection("to-dos").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
        
    }
    
    func deleteTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTIONS_USERS.document(uid).collection("to-dos").document(todoId).delete() { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
        
    }
    
    func completedTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTIONS_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": true]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
            
        }
        
    }
    
    
    func unCompletedTODO(todoId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTIONS_USERS.document(uid).collection("to-dos").document(todoId).updateData(["completed": false]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
            
        }
        
    }
    
}
