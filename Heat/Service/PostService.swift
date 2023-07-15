//
//  TweetService.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/8/23.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

//struct PostService {
//
//
//    func uploadPost(caption: String, image: UIImage?, musicURL: URL?, completion: @escaping (Result<String, Error>) -> Void) {
//        guard let uid = Auth.auth().currentUser?.uid else {
//            completion(.failure(NSError(domain: "", code: 401, userInfo: ["description": "User is not authenticated"])))
//            return
//        }
//
//        // Convert the image to Data
//        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
//            completion(.failure(NSError(domain: "", code: 400, userInfo: ["description": "Failed to convert image to data"])))
//            return
//        }
//
//        let storageRef = Storage.storage().reference().child("posts/\(UUID().uuidString).jpg")
//
//        storageRef.putData(imageData, metadata: nil) { metadata, error in
//            if let error = error {
//                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
//                completion(.failure(error))
//                return
//            }
//
//            storageRef.downloadURL { url, error in
//                if let error = error {
//                    print("DEBUG: Failed to get download URL with error: \(error.localizedDescription)")
//                    completion(.failure(error))
//                    return
//                }
//
//                guard let imageUrl = url?.absoluteString else {
//                    completion(.failure(NSError(domain: "", code: 400, userInfo: ["description": "Failed to get download URL"])))
//                    return
//                }
//
//                var data = ["uid": uid,
//                            "caption": caption,
//                            "likes": 0,
//                            "timestamp": Timestamp(date: Date()),
//                            "imageURL": imageUrl,
//                            "musicURL": musicURL as Any] as [String : Any]
//
//                // Add the music URL to the data dictionary if it exists
//                if let musicURL = musicURL {
//                    let musicStorageRef = Storage.storage().reference().child("music/\(UUID().uuidString).mp3")
//
//                    musicStorageRef.putFile(from: musicURL, metadata: nil) { metadata, error in
//                        if let error = error {
//                            print("DEBUG: Failed to upload music file with error: \(error.localizedDescription)")
//                            completion(.failure(error))
//                            return
//                        }
//
//                        musicStorageRef.downloadURL { url, error in
//                            if let error = error {
//                                print("DEBUG: Failed to get music download URL with error: \(error.localizedDescription)")
//                                completion(.failure(error))
//                                return
//                            }
//
//                            guard let musicUrl = url?.absoluteString else {
//                                completion(.failure(NSError(domain: "", code: 400, userInfo: ["description": "Failed to get music download URL"])))
//                                return
//                            }
//
//                            data["musicURL"] = musicUrl
//                            Firestore.firestore().collection("posts").addDocument(data: data) { error in
//                                if let error = error {
//                                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
//                                    completion(.failure(error))
//                                    return
//                                }
//
//                                // call completion handler with the created post ID
//                                completion(.success(""))
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
struct PostService {
    
    func uploadPost(caption: String, image: UIImage?, musicURL: URL?, completion: @escaping (Result<String, Error>) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion(.failure(NSError(domain: "", code: 401, userInfo: ["description": "User is not authenticated"])))
            return
        }
        
        // Convert the image to Data
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: ["description": "Failed to convert image to data"])))
            return
        }
        
        let storageRef = Storage.storage().reference().child("posts/\(UUID().uuidString).jpg")
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("DEBUG: Failed to get download URL with error: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                
                guard let imageUrl = url?.absoluteString else {
                    completion(.failure(NSError(domain: "", code: 400, userInfo: ["description": "Failed to get download URL"])))
                    return
                }
                
                var data = ["uid": uid,
                            "caption": caption,
                            "likes": 0,
                            "timestamp": Timestamp(date: Date()),
                            "imageURL": imageUrl,
                            "musicURL": musicURL as Any] as [String : Any]
                
                // Add the music URL to the data dictionary if it exists
                if let musicURL = musicURL {
                    let musicStorageRef = Storage.storage().reference().child("music/\(UUID().uuidString).mp3")
                    
                    musicStorageRef.putFile(from: musicURL, metadata: nil) { metadata, error in
                        if let error = error {
                            print("DEBUG: Failed to upload music file with error: \(error.localizedDescription)")
                            completion(.failure(error))
                            return
                        }
                        
                        musicStorageRef.downloadURL { url, error in
                            if let error = error {
                                print("DEBUG: Failed to get music download URL with error: \(error.localizedDescription)")
                                completion(.failure(error))
                                return
                            }
                            
                            guard let musicUrl = url?.absoluteString else {
                                completion(.failure(NSError(domain: "", code: 400, userInfo: ["description": "Failed to get music download URL"])))
                                return
                            }
                            
                            data["musicURL"] = musicUrl
                            Firestore.firestore().collection("posts").addDocument(data: data) { error in
                                if let error = error {
                                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
                                    completion(.failure(error))
                                    return
                                }
                                
                                // call completion handler with the created post ID
                                completion(.success(""))
                            }
                        }
                    }
                }
            }
        }
    }

                       


    
    func fetchPosts(completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("posts")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
                completion(posts)
            }
        }
    
    func fetchPosts(forUid uid: String, completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("posts")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
                completion(posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
        }
    
    func likePosts(_ post: Post, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("posts").document(postId).updateData(["likes" : post.likes + 1]) { _ in
            userLikesRef.document(postId).setData([:]) { _ in
                completion()
                
            }
        }
    }
    
    func checkIfUserLikedPost(_ post: Post, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(postId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
    
    func unlikePosts(_ post: Post, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        guard post.likes > 0 else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("posts").document(postId)
            .updateData(["likes" : post.likes - 1]) { _ in
                userLikesRef.document(postId).delete { _ in
                    completion()
                    
                }
            }
        
        
    }
}
