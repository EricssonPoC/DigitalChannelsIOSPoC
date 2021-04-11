//
//  MovieTableViewCell.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import UIKit

struct MovieTableViewCellPresentation: Presentation {

    let movie: Movie
}

// MARK: - MovieTableViewCell

class MovieTableViewCell: TableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Properties

    static let height: CGFloat = 80.0

    var presentation: MovieTableViewCellPresentation? {
        didSet {
            updateUI()
        }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {

        super.awakeFromNib()

        titleLabel.font = .primary15Regular
        titleLabel.numberOfLines = .zero
    }

    private func updateUI() {

        guard let presentation = self.presentation else { return }

        movieImageView.kf.setImage(with: IMGURLBuilder.getMovieImage(for: presentation.movie.posterPath))
        titleLabel.text = presentation.movie.title
    }
}
