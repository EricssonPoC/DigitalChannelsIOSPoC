//
//  UITableView.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import UIKit

extension UITableView {

    func registerCell<T: NibLoadable & Reusable>(type: T.Type) {

        register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
}
