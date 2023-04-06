//
//  UsersProfileView.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct UsersProfileView: View {
    var user: AppUser
    
    @StateObject var profileService = ProfileService()
    @State private var selection = 0
    
    var body: some View {
        
        ScrollView {
            ProfileHeader(user: user, following: $profileService.following, followers: $profileService.followers)
            
            HStack {
                FollowButton(user: user, followCheck: $profileService.followCheck, followingCount: $profileService.following, followersCount: $profileService.followers)
            }.padding(.horizontal)
        }.padding()
        .navigationBarTitle(Text(self.user.email))
            .onAppear {
                //MARK: Pass data from search
            }
    }
}

