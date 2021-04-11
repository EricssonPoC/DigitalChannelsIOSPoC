//
//  Session.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {

    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let data = UserDefaults.standard.object(forKey: key) as? Data,
               let value = try? JSONDecoder().decode(T.self, from: data) {
                return value
            }
            return  defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}

// MARK: - Session

enum Session {

    @UserDefault("watchlist", defaultValue: [])
    static var watchList: [Movie]

    @UserDefault("favorites", defaultValue: [])
    static var favorites: [Movie]
}
