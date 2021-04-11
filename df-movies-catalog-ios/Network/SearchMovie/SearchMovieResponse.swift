//
//  SearchMovieResponse.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import YMNetwork_Swift

struct SearchMovieResponse: YMResponse {

    private enum CodingKeys: String, CodingKey {

        case page
        case numberOfResults = "total_results"
        case numberOfPages = "total_pages"
        case movies = "results"
    }

    let page: Int?
    let numberOfResults: Int?
    let numberOfPages: Int?
    let movies: [Movie]?
}

// MARK: - Movie

struct Movie: YMModel, Equatable {

    let id: Int?
    let posterPath: String?
    let backdropPath: String?
    let title: String?
    let releaseDate: String?
    let rating: Float?
    let overview: String?

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case title
        case releaseDate = "release_date"
        case rating = "vote_average"
        case overview
    }
}

// MARK: - List Helper

extension Array where Element == Movie {

    mutating func addOrRemoveToList(movie: Movie?) {

        guard let movie = movie else { return }

        if contains(movie) {
            if let index = firstIndex(of: movie) {
                remove(at: index)
            }
        } else {
            append(movie)
        }
    }
}
