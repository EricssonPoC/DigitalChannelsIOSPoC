//
//  Array.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import Foundation

public extension Array {

    // Safe subscripts. Avoids to crash for nonexist items
    subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}
