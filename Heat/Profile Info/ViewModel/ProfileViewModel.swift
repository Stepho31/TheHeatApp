//
//  ProfileViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/13/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    private let service = PostService()
    let user: AppUser
    
    init(user: AppUser) {
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        service.fetchPosts(forUid: uid) { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                self.posts[i].user = self.user
            }
        }
    }
    
}
