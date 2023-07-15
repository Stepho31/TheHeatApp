//
//  OptionalMedia.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/28/23.
//

//import SwiftUI
//import AVFoundation
//import SwiftUI
//
//struct OptionalMedia: View {
//    var url: URL?
//
//    var body: some View {
//        Group {
//            if let url = url {
//                if url.pathExtension == "mp3" {
//                    AudioPlayer(url: url)
//                } else {
//                    Image(uiImage: UIImage(contentsOfFile: url.path)!)
//                        .resizable()
//                        .scaledToFit()
//                }
//            }
//        }
//    }
//}
//
//
//struct OptionalMedia_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionalMedia()
//    }
//}
