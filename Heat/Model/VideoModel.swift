//
//  Video.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/16/22.
//

import SwiftUI

struct Video: Identifiable, Encodable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let viewCount: Int
    let uploadDate: String
    let url: URL
}

struct VideoList {
    
    static let topTen = [
        Video(imageName: "Purposee",
              title: "Since96 Ft. DP - Purpose",
              description: "During this crazy time in 2020, I just wanted to go give people a way to vent or find their Purpose. Drop #PURPOSE2020 if you found your purpose.",
              viewCount: 249,
              uploadDate: "July 25",
              url: URL(string: "https://www.youtube.com/watch?v=l2R41ABaEy8")!),
        
        Video(imageName: "Kitty",
              title: "Kitty - Sway",
              description: "",
              viewCount: 59,
              uploadDate: "Feb 14, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=qhyC5hTxnag")!),
        
        Video(imageName: "doyou",
              title: "Do You Right x Since96",
              description: "",
              viewCount: 115,
              uploadDate: "May 6, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=iAyhDyEFgWo")!),
              
        Video(imageName: "sipp",
              title: "Sippy x Since96",
              description: "",
              viewCount: 67,
              uploadDate: "Nov 17, 2020",
              url: URL(string: "https://www.youtube.com/watch?v=kviIMl43Mlo")!),
        
        Video(imageName: "Sunset",
              title: "Wait x Since96",
              description: "Official Music Video of Since96's Wait, more to come!",
              viewCount: 206,
              uploadDate: "Dec 13, 2018",
              url: URL(string: "https://www.youtube.com/watch?v=rlfezVUXDBQ")!),
        
        Video(imageName: "appstore-4",
              title: "Magic City x Since96",
              description: "",
              viewCount: 1,
              uploadDate: "May 27, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=D8KVSUqLMNw")!),
        
        
        Video(imageName: "thank you texas",
              title: "Thank You Texas x Since96",
              description: "",
              viewCount: 50,
              uploadDate: "Dec 16, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=7FMeGA9Rols&list=OLAK5uy_nWPIG-BueL54bn47PV5P3A1GShSCB5zEg")!),
        Video(imageName: "Truuu",
              title: "Truth Be Told x Since96",
              description: "",
              viewCount: 350,
              uploadDate: "March 23, 2022",
              url: URL(string: "https://www.youtube.com/playlist?list=OLAK5uy_k9lHpp7cWVlUOsjpEwygYitxd620_XxBE")!),
        Video(imageName: "Yourstru",
              title: "Yours Truly x Don Lace",
              description: "",
              viewCount: 1,
              uploadDate: "April 13, 2022",
              url: URL(string: "https://www.youtube.com/playlist?list=OLAK5uy_ldc18ohFmdAnZMPBqwY_vbX0A2ds-v4q4")!),
        Video(imageName: "zay black",
              title: "SWEET CHIN MUSIC x Zaygusto+",
              description: "",
              viewCount: 1,
              uploadDate: "June 24, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=5Tyc9bZZ7VE&list=OLAK5uy_kr98nh6nCV-CIY7Z4q33lr7QI28_1_Lnc")!),
        Video(imageName: "zayblue",
              title: "Sayless x Zaygusto+",
              description: "",
              viewCount: 1,
              uploadDate: "September 19, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=QbqSpUs5K-0&list=OLAK5uy_k--G8-UFZhbC3MD-IhfR2qHRrhk2OjPt0")!),
        Video(imageName: "conversation",
              title: "Conversation x Since96",
              description: "",
              viewCount: 1,
              uploadDate: "May 27, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=tYoeSSsAq64")!),
        Video(imageName: "Donn",
              title: "Late Nite x Don Lace",
              description: "",
              viewCount: 1,
              uploadDate: "December 16, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=rP-NfAf5sQQ&list=OLAK5uy_l_1F96D3vvoTqidD0zcgjFsSmWPiU_VqQ")!),
        Video(imageName: "DonSpa",
              title: "Late Nite x Don Lace",
              description: "",
              viewCount: 1,
              uploadDate: "June 17, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=8HyVkwwsBVs&list=OLAK5uy_kD8ef7xDD4_SEPVLoZ_itfzqa0kaBL4q0")!),
        Video(imageName: "Got it",
              title: "Got It On Me x ROSEE",
              description: "",
              viewCount: 1,
              uploadDate: "February 18, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=B4Qbd5j6M00")!),
        Video(imageName: "Holdit",
              title: "Hold It Forever x Since96",
              description: "",
              viewCount: 1,
              uploadDate: "February 18, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=B4Qbd5j6M00")!),
        Video(imageName: "Openlate",
              title: "Boo x OpenLate",
              description: "",
              viewCount: 1,
              uploadDate: "December 15, 2021",
              url: URL(string: "https://www.youtube.com/watch?v=FiaVybaNB3Q")!),
        
    ]
}

