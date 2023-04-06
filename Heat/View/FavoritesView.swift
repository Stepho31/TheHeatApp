//
//  FavoritesView.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/30/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("")
                    .navigationTitle("Favorites")
                    .navigationBarTitleDisplayMode(.inline)
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 300, height: 300)
                                .background(.red)
                                .cornerRadius(300)
                        }
                    }
                }
                .frame(height: 615)
            }
        }
    }
}
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
