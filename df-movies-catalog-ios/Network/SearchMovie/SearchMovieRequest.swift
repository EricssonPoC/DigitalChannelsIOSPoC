//
//  SearchMovieRequest.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import YMNetwork_Swift

class SearchMovieRequest: BaseRequest {

    var path: String = "search/movie"
    var urlParameters: Parameters?

    init(page: Int, movieName: String) {

        urlParameters = apiKey
        urlParameters?["page"] = page
        urlParameters?["query"] = movieName.replacingOccurrences(of: " ", with: "+")
    }
}
