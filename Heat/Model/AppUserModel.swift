//
//  AppUser.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/22/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

struct AppUser: Identifiable, Codable {
    
    @DocumentID var id: String?
    var username: String
    var fullname: String
    var profileImageUrl: String
    var email: String
    var searchName: [String]
    
    
    init(data: [String: Any]) {
        self.id = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.fullname = data["fullname"] as? String ?? ""
        self.searchName = data["searchName"] as? [String] ?? []
    }
    
    init?(fromDictionary dict: [String: Any]) {
        guard let id = dict["uid"] as? String,
            let username = dict["username"] as? String,
            let fullname = dict["fullname"] as? String,
            let profileImageUrl = dict["profileImageUrl"] as? String,
            let email = dict["email"] as? String,
            let searchName = dict["searchName"] as? [String]
        else {
            return nil
        }
        
        self.id = id
        self.username = username
        self.fullname = fullname
        self.profileImageUrl = profileImageUrl
        self.email = email
        self.searchName = searchName
    }
}

