//
//  NewPostView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/25/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewPostView: View {
    
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemRed))
                }
                
                Spacer()

                Button {
                    viewModel.uploadPost(withCaption: caption)
                } label: {
                    Text("Post")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemRed))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                
            }
            .padding()
            
            HStack(alignment: .top) {
                if let currentUser = authViewModel.currentUser {
                    WebImage(url: URL(string: currentUser.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
               
                
                
                TextArea("What's Hot", text: $caption)
                
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadPost) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

//struct NewTweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
