//
//  StoryboardBased.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import UIKit

/// Protocol to conform to be instantiated from storyboard
/// Warning: Storyboard identifier must be same as the reuse identifier!
public protocol StoryboardBased {

    static var storyboardName: String { get }
    static var reuseIdentifier: String { get }
}

public extension StoryboardBased {

    static func instantiate() -> Self {

        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: reuseIdentifier
            ) as? Self else {
                fatalError(reuseIdentifier + " cannot be instantiated via storyboard")
        }

        return viewController
    }

    static var reuseIdentifier: String {

        return String(describing: self)
    }
}
