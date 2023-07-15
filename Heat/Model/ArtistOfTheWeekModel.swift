//
//  ArtistOfTheWeek.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/13/23.
//

import Foundation

struct ArtistOfTheWeekModel: Encodable {
    let artistName: String
    let artistImage: String
    let artistBio: String
}

struct Artist {
    
    static let theArtistOfTheWeek =
        ArtistOfTheWeekModel(artistName: "Swayyy", artistImage: "Bloop Bloop", artistBio: "Hard dedicated worker.")
    }

