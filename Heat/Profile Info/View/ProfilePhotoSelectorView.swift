//
//  ProfilePhotoSelectorView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/21/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account",
                           title2: "Add a profile photo")
            
            Button {
                showImagePicker = true
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "person")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                    
//                    Spacer()
                    
                }
                
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if selectedImage != nil {
                Button {
                    viewModel.uploadProfileImage(selectedImage!)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemRed))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y: 0)
            } else {
                Text("Add a photo to continue")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top, 16)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemRed))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
