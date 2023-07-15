//
//  UploadPostViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/11/23.
//

import Foundation
import UIKit

class UploadPostViewModel: ObservableObject {
    
    @Published var didUploadPost = false
    
    let service = PostService()
    
    
    func uploadPost(withCaption caption: String, image: UIImage?, musicFileURL: URL?) {
        guard let musicFileURL = musicFileURL else {
            // Show error message to user
            print("DEBUG: Music file URL is nil.")
            return
        }
        
        print("DEBUG: Uploading post with caption: \(caption), image: \(image as Any), musicFileURL: \(musicFileURL).")
        
        service.uploadPost(caption: caption, image: image, musicURL: musicFileURL) { result in
            switch result {
            case .success:
                // Dismiss screen
                self.didUploadPost = true
            case .failure(let error):
                // Show error message to user
                print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
            }
        }
    }

}

