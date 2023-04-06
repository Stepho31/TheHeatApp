//
//  FollowServiceManager.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/5/23.
//

import Foundation

class FollowServiceManager: ObservableObject {
  var profileService = ProfileService()
  let followService = FollowService()
}
