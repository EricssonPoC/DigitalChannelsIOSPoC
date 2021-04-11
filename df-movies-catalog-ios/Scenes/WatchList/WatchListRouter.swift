//
//  WatchListRouter.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import Foundation

// MARK: - WatchListRoutable

protocol WatchListRoutable {

    func routeToWatchList(from context: BaseViewController)
}

extension WatchListRoutable {

    func routeToWatchList(from context: BaseViewController) {

        let vc = WatchListViewController.instantiate()
        vc.hidesBottomBarWhenPushed = true
        context.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DefaultWatchListRouter

struct DefaultWatchListRouter: WatchListRouter {}
