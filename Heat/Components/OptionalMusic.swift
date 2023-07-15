//
//  OptionalMedia.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/28/23.
//

import SwiftUI
import AVKit

struct OptionalMusic: View {
    
    @State private var isPlaying = false
    @State private var player: AVPlayer?
    
    var url: URL?

    var body: some View {
        Group {
            if let url = url {
                HStack {
                    Button(action: {
                        isPlaying.toggle()
                        if isPlaying {
                            player = AVPlayer(url: url)
                            player?.play()
                        } else {
                            player?.pause()
                            player = nil
                        }
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.title)
                    }
                    .padding(.trailing)
                    
                    Text(url.lastPathComponent)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(.secondarySystemBackground))
                
                if let player = player {
                    PlayerView(player: player)
                        .id(url.absoluteString) // Add unique identifier
                }
            }
        }
    }
}

struct PlayerView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        let playerLayer = AVPlayerLayer(player: player)
        let view = UIView(frame: .zero)
        view.layer.addSublayer(playerLayer)
        playerLayer.frame = view.bounds
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        print("PlayerView updateUIView method called")
    }
}
