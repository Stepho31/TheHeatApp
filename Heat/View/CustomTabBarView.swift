//
//  CustomTabBar.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/16/22.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct CustomTabBar: View {
    
    @State var videos: [Video] = VideoList.topTen
    
    @State var selectedIndex = 0
    @State var shouldShowModel = false
    @State var shouldShowLogOutOptions = false
    
    @ObservedObject var favorites = Favorites()
    @EnvironmentObject var viewModel: AuthViewModel
    
    let tabBarImageNames = ["music.note.house", "person.2.crop.square.stack", "flame", "heart", "person.crop.square"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                
                WebImage(url: URL(string: viewModel.currentUser?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 44)
                        .stroke(Color(.label), lineWidth: 1)
                    )
                .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 4) {
                    let email = viewModel.currentUser?.email.replacingOccurrences(of: "@gmail.com", with: "") ?? ""
                    Text(email)
                    .font(.system(size: 24, weight: .bold))
                    HStack {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 14, height: 14)
                        Text("online")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.lightGray))
                    }
                    

                }
                Spacer()
                Button {
                    shouldShowLogOutOptions.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(.label))
                    
                }
            }
            .padding()
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                    .destructive(Text("Sign Out"), action: {
                        print("handle sign out")
                        viewModel.signOut()
                    }),
                    .cancel()
                ])
            }
            .fullScreenCover(isPresented: $viewModel.didAuthenticateUser, onDismiss: nil) {
                LoginView()
        }
        
            ZStack {
                
                Spacer().fullScreenCover(isPresented: $shouldShowModel, content: {
                    Button(action: {shouldShowModel.toggle()}, label: {
//                        ArtistOfTheWeekView()
                        WelcomePageView()
                    })
                })
                switch selectedIndex {
                case 0:
                    NavigationView {
                        ZStack {
                            FeedView()

                        }
                        
                    }
                case 1:

                        VideoListView()

                case 3:
                    
                FavoritesView()
                    
                default:
                    
                    Profile()
                }
                
            }
            
            Divider()
                .padding(.bottom, 12)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        if num == 2 {
                            shouldShowModel.toggle()
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 45, weight: .bold))
                                .foregroundColor(.red)
                            Spacer()
                            
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.red) : .init(white: 0.8))
                            Spacer()
                        }
                    })
                    
                }
                
            }
        }
    }
    
    struct CustomTabBar_Previews: PreviewProvider {
        static var previews: some View {
            CustomTabBar()
                .preferredColorScheme(.dark)
            
            CustomTabBar()
        }
    }
}

