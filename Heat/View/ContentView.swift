//
//  ContentView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            // no user logged in
            if viewModel.userSession == nil {
                LoginView()
                
            } else {
                // have a logged in user
                CustomTabBar()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
