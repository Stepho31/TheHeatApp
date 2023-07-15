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
    @ObservedObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selection = 1

    
    init(user: AppUser) {
        self.profileViewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .center, spacing: 4) {
                    
                    ProfileHeader(user: self.viewModel.currentUser, following: $profileService.following, followers: $profileService.followers)
                    
                }
                VStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(profileViewModel.posts) { post in
                                PostView(post: post)
                                    .padding()
                            }
                        }
                        
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
