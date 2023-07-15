//
//  ArtisOfTheWeekView.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/13/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArtisOfTheWeekView: View {
    
//    let viewModel: ArtistOfTheWeekModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 80) {
                Spacer()
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                VStack(spacing: 35) {
                    Text("Artist Name")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(.black))
                    
                    VStack(spacing: 15) {
                        Text("Artist Bio: ")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(Color(.black))
                        
                        Text("I am ChatGPT, a large language model designed and developed by OpenAI. I was built on the GPT-3.5 architecture and trained on a vast corpus of text data to generate human-like responses to various prompts and questions.")
                            .font(.system(size: 24, weight: .light))
                            .foregroundColor(Color(.black))
                        
                    }
                    
                    VStack(spacing: 35) {
                        
                        Text("Top Songs")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(Color(.black)) 
                        
                        HStack(spacing: 25) {
                            Text("Life")
                            Text("Drako")
                        }
                        HStack(spacing: 25) {
                            Text("Cargo")
                            Text("Right")
                            
                        }
                    }
                    
                }
                
            }
            
            Spacer()
        }
    }
}
