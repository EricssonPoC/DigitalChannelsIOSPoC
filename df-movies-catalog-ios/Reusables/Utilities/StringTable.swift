//
//  StringTable.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import Foundation
import Foundation

enum StringTable: String {

    case registration = "Registration"
    case favorites = "Favorites"
    case search = "Search"
    case watchList = "WatchList"

    /// example: StringTable.dashboard.localized("loadmoney_keyboardButtonActionTitle")
    func localized(_ key: String) -> String {
        return LocalizationManager.shared.localizedString(forKey: key, table: rawValue)
    }
}
