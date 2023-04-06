//
//  CommentView2.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/11/22.
//

import SwiftUI

struct CommentView2: View {
    
    @StateObject var commentService = CommentService()
    
    var body: some View {
        VStack {
            ScrollView {
                if !commentService.comments.isEmpty {
                    ForEach(commentService.comments) {
                        (comment) in
                        CommentView(comment: comment)
                    }
                }
            }
        }
        .navigationTitle("Comments")
        
        .onAppear{
            //MARK: If music here
            
            self.commentService.loadComments()
        }
        .onDisappear {
            if self.commentService.listener != nil {
                self.commentService.listener.remove()
            }
        }
    }
}


