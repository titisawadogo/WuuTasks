//
//  AuthViewModel.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/22/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    @Published var currentUser: AppUser?
    
    
    static let shared = AuthViewModel()
    
    
    init() {
        
        userSession = Auth.auth().currentUser
        fetchUser()
        
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        COLLECTIONS_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: AppUser.self) else { return }
            self.currentUser = user
            
        }
        
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login Failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
        }
        
    }
    
    
    func register(withEmail email: String, password: String, firstname: String, lastName: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: register Failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["uid": user.uid,
                        "firstName": firstname,
                        "lastName": lastName,
                        "email": email]
            
            COLLECTIONS_USERS.document(user.uid).setData(data) { _ in
                print("Successfully uploaded")
                self.userSession = user
                self.fetchUser()
            }
                
        }
        
    }
    
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    
    func resetPassword(withEmail email: String) {
        
        Auth.auth().sendPasswordReset(withEmail: email) { result in
           print("Email has been sent")
        }
        
    }
    
    
}
