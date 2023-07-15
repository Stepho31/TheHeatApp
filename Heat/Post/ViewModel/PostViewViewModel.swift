//
//  PostViewViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/17/23.
//

import Foundation

class PostViewViewModel: ObservableObject {
    
    @Published var post: Post
    private let service = PostService()
    
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    func likePosts() {
        service.likePosts(post) {
            self.post.didLike = true
            
        }
    }
    
    func unlikePosts() {
        service.unlikePosts(post){
            self.post.didLike = false
        }
    }
    func checkIfUserLikedPost() {
        service.checkIfUserLikedPost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
        }
    }
}
