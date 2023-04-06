//
//  ExploreUserView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/30/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreUserView: View {
    
    let user: AppUser
    
    var body: some View {
        HStack {
            Image(user.profileImageUrl)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(user.fullname)
                    .font(.headline)
                Text(user.username)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
