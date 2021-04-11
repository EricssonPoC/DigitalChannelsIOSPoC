//
//  MovieDetailRouter.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import Foundation

protocol MovieDetailRouter {}

struct DefaultMovieDetailRouter: MovieDetailRouter {}

protocol MovieDetailRoutable {

    func routeToMovieDetail(from context: BaseViewController, movie: Movie)
}

extension MovieDetailRoutable {

    func routeToMovieDetail(from context: BaseViewController, movie: Movie) {

        let vc = MovieDetailViewController.instanceFromNib()
        vc.presentation = MovieDetailPresentation(movie: movie)
        vc.hidesBottomBarWhenPushed = true
        context.navigationController?.pushViewController(vc, animated: true)
    }
}
