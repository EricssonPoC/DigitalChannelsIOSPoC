//
//  IMGURLBuilder.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import UIKit

class IMGURLBuilder {

    private enum Constants {

        static let tmdbImageEndpoint = "https://image.tmdb.org/t/p/"
    }

    static func getMovieImage(for path: String?, width: CGFloat = .zero) -> URL? {

        // Since moviedb doesn't support every size of image just putting default 500
        return URL(string: Constants.tmdbImageEndpoint + "w500" + (path ?? ""))
    }
}
