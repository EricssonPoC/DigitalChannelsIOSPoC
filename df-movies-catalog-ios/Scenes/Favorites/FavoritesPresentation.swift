//
//  FavoritesPresentation.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import UIKit

// MARK: - FavoritesPresentation

struct FavoritesPresentation: Presentation {

    var cellPresentations: [Presentation] = []
    var cellTypes: [TableViewCell.Type] = []

    mutating func update() {

        reset()
        for movie in Session.favorites.reversed() {
            cellPresentations.append(MovieTableViewCellPresentation(movie: movie))
            cellTypes.append(MovieTableViewCell.self)
        }
    }

    private mutating func reset() {

        cellPresentations = []
        cellTypes = []
    }
}

