//
//  NibLoadable.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import UIKit

// MARK: - NibLoadable

protocol NibLoadable: class {

    static var nib: UINib { get }
}

extension NibLoadable {

    static var nib: UINib {

        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// MARK: NibLoadble's UIView extension

extension NibLoadable where Self: UIView {

    /// Returns UIView object instantiated from nib.
    static func instanceFromNib() -> Self {

        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected it's root view to be of type \(self)")
        }
        return view
    }
}

// MARK: NibLoadble's UIViewController extension

extension NibLoadable where Self: UIViewController {

    /// Returns a UIViewController object instantiated from nib
    ///
    /// - Returns: A `UIViewController` instance
    static func instanceFromNib() -> Self {

        return self.init(nibName: String(describing: self), bundle: nil)
    }
}

// MARK: NibLoadble's UIViewController extension

extension NibLoadable where Self: UIView {

    func loadNibNamed() {

        Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
    }
}

// MARK: - Reusable

protocol Reusable {

    static var reuseIdentifier: String { get }
    var reuseIdentifier: String { get }
}

extension Reusable {

    static var reuseIdentifier: String {

        return String(describing: self)
    }

    var reuseIdentifier: String {

        return type(of: self).reuseIdentifier
    }
}


// MARK: - TableViewCell

class TableViewCell: UITableViewCell, NibLoadable, Reusable {

    override func awakeFromNib() {

        super.awakeFromNib()

        selectionStyle = .none
    }
}

extension TableViewCell {

    static var bundle: Bundle {
        return Bundle(for: self)
    }
}
