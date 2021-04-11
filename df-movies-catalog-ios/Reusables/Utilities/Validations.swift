//
//  Validations.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 11.04.2021.
//

import Foundation

class Validations {

    static func isValidEmail(_ email: String) -> Bool {

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    static func isValidPassword(_ password: String) -> Bool {

        return !password.isEmpty
    }
}
