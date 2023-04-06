//
//  ExploreViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/27/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [AppUser]()
    let service = UserService()
    
    init() {
        print("ExploreViewModel initialized")
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fethUseres { users in
            self.users = users
        }
    }
}
