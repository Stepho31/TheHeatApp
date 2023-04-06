//
//  Extensions.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 7/6/22.
//

import Foundation

extension String {
    func removeWhiteSpace() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

