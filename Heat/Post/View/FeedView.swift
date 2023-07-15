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

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                            .padding()
                    }
                }
            }
            .refreshable {
                print("Do your refresh work here")
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

        }
    }
}
