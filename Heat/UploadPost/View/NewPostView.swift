//
//  NewPostView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/25/23.
//

import SwiftUI
import SDWebImageSwiftUI
import UniformTypeIdentifiers
import AVKit
import AVFoundation

struct NewPostView: View {
    
    @State private var selectedMusicFile: URL?
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var showMusicPicker = false
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
                    viewModel.uploadPost(withCaption: caption, image: selectedImage, musicFileURL: selectedMusicFile)
                    presentationMode.wrappedValue.dismiss()
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
                VStack {
                    if let currentUser = authViewModel.currentUser {
                        WebImage(url: URL(string: currentUser.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipped()
                            .cornerRadius(50)
                            .overlay(RoundedRectangle(cornerRadius: 44)
                                .stroke(Color(.systemRed), lineWidth: 1)
                            )
                    }
                    Button {
                        self.showImagePicker = true
                    } label: {
                        Image(systemName: "photo")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(.systemRed))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                    Button {
                        self.showMusicPicker = true
                    } label: {
                        Image(systemName: "music.quarternote.3")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(.systemRed))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .sheet(isPresented: $showMusicPicker) {
                        DocumentPicker(supportedTypes: [.audio]) { url in
                            self.selectedMusicFile = url
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    OptionalImage(uiImage: selectedImage)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                    
                    if let musicFileURL = selectedMusicFile {
                        OptionalMusic(url: musicFileURL)
                    }
                                      
                    TextArea("What's Hot?", text: $caption)
                }
                
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadPost) { success in
            if success {
                print("DEBUG: Upload successful. Dismissing view.")
                presentationMode.wrappedValue.dismiss()
            }
//            else {
//                print("DEBUG: Upload failed.")
//            }
        }

    }
    

}
