//
//  ProfileService.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/5/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class ProfileService: ObservableObject {
    @Published var posts: [CommentModel] = []
    @Published var currentFollowStatus: Bool = false
    @Published var following = 0
    @Published var followers = 0
    
    
    @Published var followCheck = false
    
    static var following = Firestore.firestore().collection("following")
    static var followers = Firestore.firestore().collection("followers")
    
    static func followingCollection(userid: String) -> CollectionReference {
        return following.document(userid).collection("following")
    }
    
    static func followersCollection(userid: String) -> CollectionReference {
        return followers.document(userid).collection("followers")
    }
    
    static func followingId(userId: String) -> DocumentReference {
        return following.document(Auth.auth().currentUser!.uid).collection("following").document(userId)
    }
    
    static func followersId(userId: String) -> DocumentReference {
        return followers.document(userId).collection("followers").document(Auth.auth().currentUser!.uid)
    }
    
    init() {
        self.loadCounts()
    }
    
    func followState(userid: String) {
        ProfileService.followingId(userId: userid).getDocument{ (document, error) in
            if let doc = document, doc.exists {
                self.followCheck = true
                self.currentFollowStatus = true
                print("User is being followed.")
            } else {
                self.followCheck = false
                self.currentFollowStatus = false
                print("User is not being followed.")
            }
        }
    }
    
    func follows(userId: String) {
        ProfileService.followingCollection(userid: userId).getDocuments { (querysnapshot, err) in
            if let doc = querysnapshot?.documents {
                self.following = doc.count
                self.saveCounts()
                print("Number of people being followed: \(doc.count)")
            }
        }
    }
    
    func followers(userId: String) {
        ProfileService.followersCollection(userid: userId).getDocuments { (querysnapshot, err) in
            if let doc = querysnapshot?.documents {
                self.followers = doc.count
                self.saveCounts()
                print("Number of followers: \(doc.count)")
            }
        }
    }
    
    private func saveCounts() {
        let defaults = UserDefaults.standard
        defaults.set(self.following, forKey: "following")
        defaults.set(self.followers, forKey: "followers")
    }
    
    private func loadCounts() {
        let defaults = UserDefaults.standard
        self.following = defaults.integer(forKey: "following")
        self.followers = defaults.integer(forKey: "followers")
    }
    func saveFollowStatus(for userId: String, status: Bool) {
         let defaults = UserDefaults.standard
         defaults.set(status, forKey: "followStatus_\(userId)")
     }

    func loadFollowStatus(for userId: String) -> Bool? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "followStatus-\(userId)") as? Bool
    }
}
