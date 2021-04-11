//
//  FavoritesRouter.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import Foundation

// MARK: - FavoritesRoutable

protocol FavoritesRoutable {

    func routeToFavorites(from context: BaseViewController)
}

extension FavoritesRoutable {

    func routeToFavorites(from context: BaseViewController) {

        let vc = FavoritesViewController.instantiate()
        vc.hidesBottomBarWhenPushed = true
        context.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DefaultFavoritesRouter

struct DefaultFavoritesRouter: FavoritesRouter {}
