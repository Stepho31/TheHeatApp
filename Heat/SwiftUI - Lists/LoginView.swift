//
//  LoginView.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/17/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showDetails = false
    
    @State private var username: String = ""
    
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            
            VStack(alignment: .center, spacing: 10) {
                
                
            TextField("Username", text: $username) // <1>, <2>
                    .textCase(.uppercase)
                    .frame(width: 280, height: 50)
                    .background(Color.gray)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
            
            TextField("Password", text: $password) // <1>, <2>
                    .textCase(.uppercase)
                    .frame(width: 280, height: 50)
                    .background(Color.gray)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
            
        }
            
            
                  Button("Log In") {
                      showDetails.toggle()
                  }

                  if showDetails {
                      Text("You should follow me on Twitter: @twostraws")
                          .font(.largeTitle)
                  }
            
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
}
