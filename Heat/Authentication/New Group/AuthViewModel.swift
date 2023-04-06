//
//  AuthViewModel.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/20/23.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var userName = ""
    @State private var searchName: [String] = []
    @State private var password = ""

    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser: Bool = false
    @Published var currentUser: AppUser?
    
    
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        self.fetchUser()
        
       
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login user \(error.localizedDescription)")
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Did log user in..")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String, searchName: [String]) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSession = user

            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid,
                        "searchName": email.splitString()] as [String : Any]

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    if let error = error {
                                      print("Failed to store user information with error: \(error.localizedDescription)")
                                      // Handle the error, e.g. show an error message to the user
                                  } else {
                                      print("Successfully stored user information")
                                      self.didAuthenticateUser = true
                                  }
                              }
                      }
                      print("DEBUG: Registered user successfully\(searchName)")
                  }
    
    func signOut() {
        // sets user session to nil so we show login view
        userSession = nil
        
        // signs user out on backend
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fecthUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}

