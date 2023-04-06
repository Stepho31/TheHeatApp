//
//  UploadPostViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/11/23.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    
    @Published var didUploadPost = false
    
    let service = PostService()
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { success in
            if success {
                //dissmiss screen
                self.didUploadPost = true
            } else {
                //show error message to user
            }
        }
    }
}
