//
//  FollowButton.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/10/22.
//

import SwiftUI

struct FollowButton: View {
    @EnvironmentObject var followServiceManager: FollowServiceManager
    @ObservedObject var profileService = ProfileService()
    
    var user: AppUser
    @Binding var followingCount: Int
    @Binding var followersCount: Int
    @Binding var followCheck: Bool
    
    @State private var currentFollowStatus = false
    
    init(user: AppUser, followCheck: Binding<Bool>, followingCount: Binding<Int>, followersCount: Binding<Int>){
        
        self.user = user
        self._followCheck = followCheck
        self._followingCount = followingCount
        self._followersCount = followersCount
        
    }
    
    func follow() {
        if !self.followCheck {
          followServiceManager.followService.follow(userId: user.id!, followingCount: {
            (followingCount) in
            self.followingCount = followingCount
          }) {
            (followersCount) in
            self.followersCount = followersCount
          }
          
          self.followCheck = true
          self.currentFollowStatus = true
        } else {
          followServiceManager.followService.unfollow(userId: user.id!, followingCount: {
            (followingCount) in
            self.followingCount = followingCount
          }) {
            (followersCount) in
            self.followersCount = followersCount
          }
          self.followCheck = false
          self.currentFollowStatus = false
        }
      }
    
    var body: some View {
        Button(action: follow) {
            Text((self.followCheck) ? "Unfollow": "Follow")
                .modifier(ButtonModifiers())
        }
        .onChange(of: followCheck) { newValue in
            // Update the following and followers count when the followCheck value changes
            if newValue {
                followServiceManager.followService.follow(userId: user.id!, followingCount: {
                    (followingCount) in
                    self.followingCount = followingCount
                }) {
                    (followersCount) in
                    self.followersCount = followersCount
                }
                self.currentFollowStatus = true
            } else {
                followServiceManager.followService.unfollow(userId: user.id!, followingCount: {
                    (followingCount) in
                    self.followingCount = followingCount
                }) {
                    (followersCount) in
                    self.followersCount = followersCount
                }
                self.currentFollowStatus = false
            }
        }
    }
}
