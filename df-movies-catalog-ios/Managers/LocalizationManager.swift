//
//  LocalizationManager.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import Foundation

// MARK: - Language

enum Language: String {

    case english = "en"

    var locale: Locale {

        switch self {
        case .english:
            return Locale(identifier: "en")
        }
    }
}

// MARK: - LocalizationManager

class LocalizationManager {

    class var bundle: Bundle {

        return Bundle.main
    }

    static let shared = LocalizationManager()

    private enum Constants {

        static let projExtension = "lproj"
        static let stringsExtension = "strings"
        static let languageStorageKey = "selectedlanguage"
        static let appleLanguagesKey = "AppleLanguages"
    }

    private var _language: Language!

    var language: Language! {
        get {
            if _language == nil {
                if let languageID = UserDefaults.standard.string(forKey: Constants.languageStorageKey),
                    let selectedLanguage = Language(rawValue: languageID) {
                    _language = selectedLanguage
                } else if let currentLocale = Locale.current.languageCode,
                    let selectedLanguage = Language(rawValue: currentLocale) {
                    _language = selectedLanguage
                } else if let defaultLanguageID = type(of: self).bundle.preferredLocalizations.first,
                    let selectedLanguage = Language(rawValue: defaultLanguageID) {
                    _language = selectedLanguage
                } else {
                    _language = .english
                }
            }
            return _language
        }
        set {
            _language = newValue
        }
    }

    var locale: Locale {
        return Locale.current
    }

    final func localizedString(
        forKey key: String,
        table: String,
        language: Language = LocalizationManager.shared.language
        ) -> String {

        if let bundle = bundle(with: language) {
            return bundle.localizedString(forKey: key, value: nil, table: table)
        }

        return key
    }

    func bundle(with language: Language) -> Bundle? {

        if let path = type(of: self).bundle.path(forResource: language.rawValue, ofType: Constants.projExtension) {

            return Bundle(path: path)
        }

        return nil
    }
}
