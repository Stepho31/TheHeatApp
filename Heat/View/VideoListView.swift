//
//  ContentView.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/16/22.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    @ObservedObject var favorites = Favorites()
    
    
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                    
                })
                
                
                
                
            }
            .listStyle(.plain) // Set the list style to plain
            .onAppear {
                UIScrollView.appearance().showsVerticalScrollIndicator = false // Hide the scroll indicator
            }.navigationBarTitle("Library")
                .navigationBarTitleDisplayMode(.inline)
        }.environmentObject(favorites)
        

    }
    
}

struct VideoCell: View {
    
    
    @State var favoriteButtonClicked = false
    @EnvironmentObject var favorites: Favorites
    
    var video: Video
    var videos: [Video] = VideoList.topTen

    
    var body: some View {
        HStack {
        Image(video.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 80, alignment: .leading)
            .cornerRadius(4)
            .padding(.vertical, 4)
        
        VStack (alignment: .leading, spacing: 10){
            Text(video.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
            
            Text(video.uploadDate)
                .font(.subheadline)
                .foregroundColor(.secondary)

            
        }
            
    }
        
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}


}
