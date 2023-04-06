//
//  Login.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/17/22.
//

import SwiftUI
//import Firebase
//import FirebaseStorage
//import FirebaseFirestore


struct LoginView: View {
    

    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    

    
    
    @State var shouldShowImagePicker = false

    
    var body: some View {
        // parent Container
        VStack {
            
            // header View
        AuthHeaderView(title1: "Hello", title2: "Welcome Back")
            
            VStack(spacing: 40) {
                
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecuredField: true,
                                 text: $password)
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset password view..")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemRed))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemRed))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y: 0)
            .fullScreenCover(isPresented: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            }

            
            Spacer()
            ZStack {
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Dont have an account?")
                            .font(.footnote)
                            .foregroundColor(Color(.systemRed))
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemRed))
                    }
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemRed))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

