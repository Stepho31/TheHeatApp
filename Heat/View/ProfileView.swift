//
//  Profile.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/29/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct Profile: View {
    
    @ObservedObject var profileService = ProfileService()
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selection = 1
    var user: AppUser?
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .center, spacing: 4) {
                    ProfileHeader(user: self.viewModel.currentUser, following: $profileService.following, followers: $profileService.followers)
                    Button(action:{}){
                        Text("Edit Profile").font(.title).padding(.horizontal)
                            .foregroundColor(.white)
                            .background(Color(.red))
                            .cornerRadius(300)
                            .frame(width: 300, height: 50)
                    }
                    
                    
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {}) {
                //Fix right here
                NavigationLink(destination: UserProfile()) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.red)
                }
                
            })
        }
    }
    
}
