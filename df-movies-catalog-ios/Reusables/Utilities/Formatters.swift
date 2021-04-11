//
//  Formatters.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import Foundation

// MARK: - DateFormatType

enum DateFormatType: String {

    case ddMMyyyy = "dd/MM/yyyy"
    case yyyymmdd = "yyyy-MM-dd"
}

enum Formatters {

    static func dateFormatter(for type: DateFormatType) -> DateFormatter {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        dateFormatter.timeZone = .current
        dateFormatter.locale = LocalizationManager.shared.language.locale
        return dateFormatter
    }

    static func convertDateFormat(from: DateFormatType, to: DateFormatType, dateString: String) -> String {

        let dateFormatter = Formatters.dateFormatter(for: from)
        if let date = dateFormatter.date(from: dateString) {
            let expectedDate = Formatters.dateFormatter(for: to).string(from: date)
            return expectedDate
        }
        return dateString
    }
}
