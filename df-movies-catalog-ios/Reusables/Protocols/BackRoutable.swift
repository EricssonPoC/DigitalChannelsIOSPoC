//
//  BackRoutable.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

protocol BackRoutable {

    func routeToBack(from context: BaseViewController)
}

extension BackRoutable {

    func routeToBack(from context: BaseViewController) {

        context.navigationController?.popViewController(animated: true)
    }
}
