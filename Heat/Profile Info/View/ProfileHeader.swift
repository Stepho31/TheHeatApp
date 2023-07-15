//
//  ProfileHeader1.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/6/22.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    var user: AppUser?
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        HStack {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Followers").font(.footnote)
                    Text("\(followers)").font(.title).bold()
                }.padding(.top, 10)
                Spacer()
                VStack {
                    Text("Following").font(.footnote)
                    Text("\(following)").font(.title).bold()
                }.padding(.top, 10)
                Spacer()
            }
        }
//            Text(user!.searchName)
        }
    }
}
