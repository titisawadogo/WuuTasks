//
//  AppUser.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/22/22.
//

import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }

}
