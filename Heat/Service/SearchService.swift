//
//  SearchService.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/6/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class SearchService {
    
    static func searchUsers(input: String, onSuccess: @escaping (_ user: [AppUser]) -> Void) {
        print("searching for users with input: \(input)")
        Firestore.firestore().collection("users").whereField("searchName", arrayContains: input.lowercased().removeWhiteSpace()).getDocuments { (querysnapshot, err) in
            print("query: users where searchName contains \(input.lowercased().removeWhiteSpace())")
            guard let snap = querysnapshot else {
                print("error")
                return
            }
            var users = [AppUser]()
            for document in snap.documents {
                let dict = document.data()
                guard let decoded = AppUser.init(fromDictionary: dict) else {
                    print("error decoding user: \(dict)")
                    return
                }
                print("decoded user: \(decoded)")
                
                if decoded.id != Auth.auth().currentUser!.uid {
                    users.append(decoded)
                } else {
                    print("skipping current user: \(decoded)")
                }
            }
            onSuccess(users)
            print("searchUsers completed with \(users.count) users")
        }
    }
}

