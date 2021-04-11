//
//  BaseRequest.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import YMNetwork_Swift

protocol BaseRequest: YMRequest {

    var apiKey: Parameters? { get }
}

extension BaseRequest {

    var apiKey: Parameters? {
        return ["api_key": Global.TheMovieDB.apiKey]
    }
}
