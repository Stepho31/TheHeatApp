//
//  PostView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/25/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    let post: Post
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let user = post.user {
                // Profile image + user info + tweet
                HStack(alignment: .top, spacing: 12) {
                    WebImage(url: URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // user info & tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        
                        // user info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        // tweet caption
                        Text(post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }
                }
            }
            // action buttons
            
            HStack {
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

//struct Tweet _Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
