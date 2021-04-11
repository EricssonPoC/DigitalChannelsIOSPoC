//
//  Global.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import Foundation

enum Global {

    // MARK: - Network Environment

    enum NetworkEnvironment {

        case alpha
        case beta
        case prod

        var baseURL: String {
            switch NetworkManager.environment {
            case .alpha: return "https://api.themoviedb.org/3/"
            case .beta: return "https://api.themoviedb.org/3/"
            case .prod: return "https://api.themoviedb.org/3/"
            }
        }
    }

    enum TheMovieDB {

        static let apiKey = "e9d9dcae84d9a94aedc5412e5e521fc7"
    }

    // MARK: - Storyboards

    enum Storyboard {

        enum Registration {
            static let name = "Registration"
        }

        enum Search {
            static let name = "Search"
        }

        enum WatchList {
            static let name = "WatchList"
        }

        enum Favorites {
            static let name = "Favorites"
        }
    }
}
