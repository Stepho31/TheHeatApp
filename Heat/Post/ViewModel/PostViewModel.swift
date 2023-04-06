//
//  PostViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/11/23.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isLoading = false
  
    let service = PostService()
    let userService = UserService()
    
    init() {
        
        fetchPosts()
    }
    
    func fetchPosts() {
        service.fetchPosts { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                
                self.userService.fecthUser(withUid: uid) { user in
                    self.posts[i].user = user
                }
                
            }
            self.isLoading = false
            }
        }
    }
