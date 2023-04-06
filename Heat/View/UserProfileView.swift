//
//  UserProfile.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/6/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfile: View {
    
    
    @State private var value: String = ""
    @State var users: [AppUser] = []
    @State var isLoading = false

    func searchUsers() {
        isLoading = true
        
        print("searchUsers() called with input: \(value)")

        SearchService.searchUsers(input: value) {
            (users) in
            self.isLoading = false
            self.users = [] // Reset the users array before assigning new results
            self.users = users
            print("searchUsers() returned \(users.count) users")
        }
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                SearchBar(value: $value).padding()
                    .onChange(of: value, perform: {
                        new in
                        searchUsers()
    
                    })
                
                if !isLoading {
                    ForEach(users, id:\.id) {
                        
                        user in
                        
                        NavigationLink(destination: UsersProfileView(user: user)) {
                        
                        
                        
                        //MARK: Change searched user info
                        HStack {
//                            Text("\(user.email)")
                            WebImage(url: URL(string: user.profileImageUrl)!)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60, alignment: .trailing)
                                .padding()
                            
                            Text(user.email).font(.subheadline).bold()
                            
                        }
//                        Divider().background(Color.black)
                    }
                    }
                }
                
            }
        }.navigationTitle("User Search")
        }
    }

