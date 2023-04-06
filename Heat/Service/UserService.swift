//
//  UserService.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/20/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fecthUser(withUid uid: String, completion: @escaping(AppUser) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: AppUser.self) else { return }
                completion(user)
                
                print("DEBUG: Usernme is \(user.username)")
                print("DEBUG: Usernme is \(user.email)")
            }
    }
    
    func fethUseres(completion: @escaping([AppUser]) -> Void) {
        var users = [AppUser]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { document in
                    guard let user = try? document.data(as: AppUser.self) else { return }
                    users.append(user)
                    print("Amount of users \(users.count)")
                }
                completion(users)
                
                
            }
        
    }
}

