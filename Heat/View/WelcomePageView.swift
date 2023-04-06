//
//  WelcomePage.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/22/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct WelcomePageView: View {
    
//    @ObservedObject private var vm = CustomTabBarModel()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 4) {
                    let email = viewModel.currentUser?.email.replacingOccurrences(of: "@gmail.com", with: "") ?? ""
                    
                    Text("Welcome Back! \(email)")
                        .multilineTextAlignment(.center)
                       .font(.system(size: 36))
                       .foregroundColor(.white)
                       .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.white, lineWidth: 4)
                        )
                        .frame(maxHeight: .infinity, alignment: .top)
                           .frame(width: 300)
                           .background(
                            WebImage(url: URL(string: viewModel.currentUser?.profileImageUrl ?? ""))
                                .resizable()
                                .frame(width: 1000, height: 1000)
                                .blur(radius: 25, opaque: false)
                            


                             )
                }
                
                .frame(height: 350)
            }
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
