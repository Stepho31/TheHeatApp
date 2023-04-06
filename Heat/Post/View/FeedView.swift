//
//  FeedView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/25/23.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = PostViewModel()
//    @State private var isLoading = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                            .padding()
                    }
                }
//                .onAppear {
//                    isLoading = true
//                    viewModel.fetchPosts()
//                    isLoading = false
//                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "bubble.left.and.bubble.right")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemRed))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewPostView()
            }
//            if isLoading {
//                VStack {
//                    ProgressView()
//                    // and if you want to be explicit / future-proof...
//                    // .progressViewStyle(CircularProgressViewStyle())
//                }
//            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

