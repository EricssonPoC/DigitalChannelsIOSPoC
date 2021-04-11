//
//  SearchRouter.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import Foundation

// MARK: - SearchRoutable

protocol SearchRoutable {

    func routeToSearch(from context: BaseViewController)
}

extension SearchRoutable {

    func routeToSearch(from context: BaseViewController) {

        let vc = SearchViewController.instantiate()
        vc.hidesBottomBarWhenPushed = true
        context.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DefaultSearchRouter

struct DefaultSearchRouter: SearchRouter {}
