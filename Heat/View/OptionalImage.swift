//
//  OptionalImage.swift
//  SwiftUI - Lists
//
//  Created by Stephen Byron on 4/17/23.
//

import SwiftUI

struct OptionalImage: View {
    
    var uiImage: UIImage?

    var body: some View {
        Group {
            if let image = uiImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}
