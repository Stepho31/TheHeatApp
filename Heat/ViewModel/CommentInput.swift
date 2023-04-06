//
//  CommentInput.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/11/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentInput: View {
    
//    @ObservedObject private var vm = CustomTabBarModel()
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var commentService = CommentService()
    @State private var text: String = ""
   
    
    
    
    func sendComment() {
        if !text.isEmpty {
            commentService.addComment(comment: text) {
                self.text = ""
            }
        }
    }
    var body: some View {
        HStack() {
            WebImage(url: URL(string: self.viewModel.currentUser!.profileImageUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .shadow(color: .gray, radius: 3)
                .padding(.trailing)
            
            HStack {
                TextEditor(text: $text)
                    .frame(height: 50)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8, style: .circular).stroke(Color.black, lineWidth: 2))
                
                Button(action: sendComment) {
                    Image(systemName: "paperplane").imageScale(.large).padding(.leading)
                }
            }
        }
    }
}
//
//struct CommentInput_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentInput()
//    }
//}
