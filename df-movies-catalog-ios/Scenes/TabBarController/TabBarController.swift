//
//  TabBarController.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 8.04.2021.
//

import UIKit

// MARK: - TabBarRoutable

protocol TabbarRoutable {

    func setRootAsTabbar()
}

extension TabbarRoutable {

    func setRootAsTabbar() {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window else { return }

        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
    }
}

// MARK: - TabInfo

struct TabInfo {

    var title: String
    var icon: UIImage?
    var viewController: BaseViewController.Type
}

// MARK: - TabBarController

class TabBarController: UITabBarController {

    private var tabInfoItems: [TabInfo] = [
        TabInfo(
            title: StringTable.search.localized("search_title"),
            icon: UIImage(systemName: "film"),
            viewController: SearchViewController.self
        ),
        TabInfo(
            title: StringTable.watchList.localized("watchList_title"),
            icon: UIImage(systemName: "list.bullet"),
            viewController: WatchListViewController.self
        ),
        TabInfo(
            title: StringTable.favorites.localized("favorites_title"),
            icon: UIImage(systemName: "heart.fill"),
            viewController: FavoritesViewController.self
        )
    ]

    // MARK: - Designated initializer

    init() {

        super.init(nibName: nil, bundle: nil)
        setupViewControllers()
    }

    required init?(coder: NSCoder) {

        super.init(coder: coder)
        setupViewControllers()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    // MARK: - Custom Methods

    private func setupViewControllers() {

        var tabViewControllers: [BaseViewController] = []

        for tab in tabInfoItems {

            if let type = tab.viewController as? StoryboardBased.Type,
                let vc = type.instantiate() as? BaseViewController {

                vc.title = tab.title
                vc.tabBarItem = UITabBarItem(
                    title: tab.title,
                    image: tab.icon,
                    selectedImage: tab.icon
                )
                tabViewControllers.append(vc)
            }
        }

        viewControllers = tabViewControllers.map { UINavigationController(rootViewController: $0) }
    }
}
