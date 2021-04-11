//
//  SearchPresentation.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import UIKit

// MARK: - SearchPresentation

struct SearchPresentation: Presentation {

    var cellPresentations: [Movie] = []

    private mutating func reset() {

        cellPresentations = []
    }

    mutating func update(with movies: [Movie]) {

        reset()

        for movie in movies {
            cellPresentations.append(movie)
        }
    }
}
