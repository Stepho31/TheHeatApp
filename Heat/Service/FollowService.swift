//
//  FollowService.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/10/22.
//

import Foundation
import Firebase

class FollowService: ObservableObject {
    
    func updateFollowCount(userId: String, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followersCount: Int) -> Void) {
        print("updateFollowCount called for user \(userId)")
        ProfileService.followingCollection(userid: userId).getDocuments { (snap, error) in
            if let doc = snap?.documents {
                print("Following count: \(doc.count)")
                followingCount(doc.count)
            }
        }
        
        ProfileService.followersCollection(userid: userId).getDocuments { (snap, error) in
            if let doc = snap?.documents {
                print("Followers count: \(doc.count)")
                followersCount(doc.count)
            }
        }
        
        ProfileService().follows(userId: userId)
        ProfileService().followers(userId: userId)
    }
    
    func manageFollow(userId: String, followCheck: Bool, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followingCount: Int) -> Void) {
        
        if !followCheck {
            follow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        } else {
            unfollow(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
    }

    func follow(userId: String, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followersCount: Int) -> Void, isCurrentUser: Bool = false) {
        ProfileService.followingId(userId: userId).setData([:]) { err in
            if err == nil {
                ProfileService.followersId(userId: userId).setData([:]) { err in
                    if err == nil {
                        self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
                    }
                }
            }
        }
    }

    func unfollow(userId: String, followingCount: @escaping (_ followingCount: Int) -> Void, followersCount: @escaping (_ followersCount: Int) -> Void) {
        ProfileService.followingId(userId: userId).getDocument { document, err in
            if let doc = document, doc.exists {
                doc.reference.delete()
            }
        }
        
        ProfileService.followersId(userId: userId).getDocument { document, err in
            if let doc = document, doc.exists {
                doc.reference.delete()
            }
            
            self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
    }

    
}
