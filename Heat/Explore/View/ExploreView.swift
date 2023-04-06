//
//  ExploreView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 3/27/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(destination: ExploreUserView(user: user)) {
                            HStack {
                                WebImage(url: URL(string: user.profileImageUrl))
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(user.fullname)
                                        .font(.headline)
                                    Text(user.username)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 8)
                        }
                        
                    }
                }
            }
            .onAppear {
                print("ExploreView appeared")
                print("Number of users: \(viewModel.users.count)")
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
