//
//  MovieDetailViewController.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import UIKit
import Kingfisher

class MovieDetailViewController: BaseViewController, NibLoadable {

    // MARK: - Outlets

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var watchListBarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var favoritesBarButtonItem: UIBarButtonItem!

    // MARK: - Properties

    var presentation: MovieDetailPresentation?

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        configureViews()
        shouldShowLargeTitle(isLarge: false)
    }

    private func configureViews() {

        let url = IMGURLBuilder.getMovieImage(
            for: presentation?.movie.backdropPath,
            width: view.frame.size.width
        )
        imageView.kf.setImage(
            with: url
        )

        titleLabel.font = .primary25Bold
        titleLabel.textColor = .beta
        titleLabel.text = presentation?.movie.title

        rateLabel.font = .primary15Regular
        rateLabel.textColor = .beta
        rateLabel.text = "\(String(format: "%.1f", arguments: [presentation?.movie.rating ?? .zero]))"

        dateLabel.font = .primary15Regular
        dateLabel.textColor = .beta
        dateLabel.text = Formatters.convertDateFormat(from: .yyyymmdd, to: .ddMMyyyy, dateString: presentation?.movie.releaseDate ?? "")

        overviewLabel.font = .primary15Regular
        overviewLabel.textColor = .gamma
        overviewLabel.numberOfLines = .zero
        overviewLabel.text = presentation?.movie.overview

        updateFavoriteBarButton()
        updateWatchListBarButton()
    }

    private func updateFavoriteBarButton() {

        guard let movie = presentation?.movie else { return }
        favoritesBarButtonItem.tintColor = Session.favorites.contains(movie) ? .alphaVariant2 : .gammaVariant1
    }

    private func updateWatchListBarButton() {

        guard let movie = presentation?.movie else { return }
        watchListBarButtonItem.tintColor = Session.watchList.contains(movie) ? .alphaVariant2 : .gammaVariant1
    }

    // MARK: - Actions

    @IBAction private func didTapOnWatchListButton(_ sender: UIBarButtonItem) {

        Session.watchList.addOrRemoveToList(movie: presentation?.movie)
        updateWatchListBarButton()
    }

    @IBAction private func didTapOnFavoriteButton(_ sender: UIBarButtonItem) {

        Session.favorites.addOrRemoveToList(movie: presentation?.movie)
        updateFavoriteBarButton()
    }
}
