//
//  ArtistOfTheWeekView.swift
//  
//
//  Created by Stephen on 6/22/22.
//

import SwiftUI

struct ArtistOfTheWeekView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .padding()
                    .background(Image("drake"))
                    .blur(radius: 15)
            Text("Artist Of The Week")
                .font(.largeTitle)
                .foregroundColor(.white)
//                .frame(width: 10, height: 5, alignment: .center)
                
                Spacer()
                VStack(spacing: 20) {
//                        Text("Arist of the Week Picture: ")
                    Image("drake")
                        .resizable()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 300, height: 300)
                            .background(.red)
                            .cornerRadius(300)
                    VStack {
                        Text("Artist Name: ")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.black))
                            .cornerRadius(30)
                        Text("Latest Album/Song:")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.black))
                            .cornerRadius(30)
                        Text("Bio:")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.black))
                            .cornerRadius(30)
                    }
                    }
                .frame(height: 800)
                
            }
        }
    }
}

struct ArtistOfTheWeekView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistOfTheWeekView()
    }
}

