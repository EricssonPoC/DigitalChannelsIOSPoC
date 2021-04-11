//
//  FavoritesViewController.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import UIKit

// MARK: - FavoritesRouter

protocol FavoritesRouter: Router, MovieDetailRoutable {}

// MARK: - FavoritesViewController

class FavoritesViewController: BaseViewController, StoryboardBased {

    static var storyboardName: String = Global.Storyboard.Favorites.name

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    private var presentation = FavoritesPresentation()
    private let router = DefaultFavoritesRouter()

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        presentation.update()
        tableView.reloadData()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false

        tableView.registerCell(type: MovieTableViewCell.self)
    }
}

// MARK: UITableViewDataSource

extension FavoritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presentation.cellPresentations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: presentation.cellTypes[safe: indexPath.row]?.reuseIdentifier ?? "",
            for: indexPath
        ) as? MovieTableViewCell else { return UITableViewCell() }

        cell.presentation = presentation.cellPresentations[safe: indexPath.row] as? MovieTableViewCellPresentation

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return MovieTableViewCell.height
    }
}

// MARK: UITableViewDelegate

extension FavoritesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cellPresentation = presentation.cellPresentations[safe: indexPath.row] as? MovieTableViewCellPresentation
        if let movie = cellPresentation?.movie {
            router.routeToMovieDetail(from: self, movie: movie)
        }
    }
}
