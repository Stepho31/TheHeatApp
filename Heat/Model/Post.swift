//
//  Post.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/11/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: AppUser?
    
}
