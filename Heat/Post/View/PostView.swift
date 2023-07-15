//
//  PostView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/25/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVFoundation

struct PostView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ObservedObject var postViewModel: PostViewViewModel
    
//    @State private var isPlaying = false
//
//    var audioPlayer: AVPlayer? {
//        guard let musicURL = postViewModel.post.musicURL else { return nil }
//        let playerItem = AVPlayerItem(url: musicURL)
//        let player = AVPlayer(playerItem: playerItem)
//        return player
//    }

    
    init(post: Post) {
        self.postViewModel = PostViewViewModel(post: post)

    }
    
    
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let user = postViewModel.post.user {
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
                            //Add Image here

                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
                        // tweet caption
                        Text(postViewModel.post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        // image
                        if let imageURL = postViewModel.post.imageURL {
                            WebImage(url: URL(string: imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(3)
                            
                        }
                        if let musicURL = postViewModel.post.musicURL {
                            // Music Player
                            OptionalMusic(url: musicURL)
                                .padding(.top, 8)
                                .padding(.bottom, 16)
                        }
//                        if postViewModel.post.musicURL != nil {
//                            //                                  Text("musicURL.absoluteString")
//                            HStack {
//                                Text("Song Name")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                                    .padding(.horizontal, 16)
//                                    .padding(.top, 8)
//                                    .padding(.bottom, 16)
//                                Button(action: {
//                                    if let player = audioPlayer {
//                                        isPlaying.toggle()
//                                        if isPlaying {
//                                            player.play()
//                                        } else {
//                                            player.pause()
//                                        }
//                                    }
//                                }) {
//                                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
//                                        .font(.system(size: 30))
//                                        .foregroundColor(.accentColor)
//                                }
//                            }
//                        }
                              
                              
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
                    postViewModel.post.didLike ?? false ? postViewModel.unlikePosts() : postViewModel.likePosts()
                } label: {
                    Image(systemName: postViewModel.post.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(postViewModel.post.didLike ?? false ? .red : .gray)
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
