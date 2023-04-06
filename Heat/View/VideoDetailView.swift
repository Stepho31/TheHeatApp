//
//  VideoDetailView.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/16/22.
//

import SwiftUI
import FirebaseFirestore

struct VideoDetailView: View {
    
    var video: Video
    @State var favoriteButtonClicked = false
    @ObservedObject var favorites = Favorites()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(15)
            
            Spacer()
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 40) {
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
//                NavigationLink(destination: CommentView2()) {
                Button {
                    return
                } label: {
                    Image(systemName: "message")
                }
                .buttonStyle(PlainButtonStyle())
//                }
                Button(action: {
                    let ref = Firestore.firestore()
                    let user = ref.collection("favorites")
                    user.getDocuments{
                        (document, error) in
                        
                        guard error == nil else{
                            print(error ?? 0)
                            return
                        }
                        
                        guard let document = document else{
                            return
                        }
                        let something = ref.collection("favorites").whereField("Favorites", isEqualTo: "Favorite")
                        something.getDocuments{
                            (querySnapshot, err) in
                                    if let err = err {
                                        print("Error getting documents: \(err)")
                                    } else {
    //MARK: Work tomorrow starts here!!
                                        if document.isEmpty == true {
                                            self.favorites.add(video)
                                            print("empty")
                                        }
                                        else{
                                            self.favorites.remove(video)
                                            
                                            print("something inside")
                                        }
                                    }
                        }    }
                    self.favoriteButtonClicked.toggle()

                }) {
                    Image(systemName: self.favoriteButtonClicked == true ? "heart.fill" : "heart")
          }

                .buttonStyle(PlainButtonStyle())
                    
            }
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: video.url, label: {
                Text("Watch Now")
                    .bold()
                    .font(.title2)
                    .frame(width: 280, height: 50)
                    .background(Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                
        })
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: VideoList.topTen.first!)
    }
}
}
