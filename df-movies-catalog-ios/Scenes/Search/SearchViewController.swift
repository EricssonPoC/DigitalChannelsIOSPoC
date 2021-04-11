//
//  SearchViewController.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import UIKit

// MARK: - SearchRouter

protocol SearchRouter: Router, MovieDetailRoutable {}

// MARK: - SearchViewController

class SearchViewController: BaseViewController, StoryboardBased {

    private enum Constants {

        static let defaultCellIdentifier = "DefaultCell"
    }

    static var storyboardName: String = Global.Storyboard.Search.name

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()

    // MARK: - Properties

    private var presentation = SearchPresentation()
    private let router = DefaultSearchRouter()
    private let viewModel = SearchViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()
        configureViews()
        addChangeHandlers()
    }

    private func configureViews() {

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.defaultCellIdentifier)
        tableView.tableFooterView = UIView()

        navigationItem.searchController = searchController

        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
    }

    private func addChangeHandlers() {

        viewModel.addChangeHandler { [weak self] (state) in

            guard let self = self else { return }

            switch state {
            case .loading:
                self.showLoadingView()
            case .loaded(let movies):
                self.hideLoadingView()
                self.presentation.update(with: movies)
                self.tableView.reloadData()
            case .failed(let error):
                self.hideLoadingView()
                print(error)
            }
        }
    }
}

// MARK: UITableViewDataSource

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presentation.cellPresentations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.defaultCellIdentifier, for: indexPath)

        cell.textLabel?.text = presentation.cellPresentations[safe: indexPath.row]?.title

        return cell
    }
}

// MARK: UITableViewDelegate

extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let movie = presentation.cellPresentations[safe: indexPath.row] {
            router.routeToMovieDetail(from: self, movie: movie)
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.row == (presentation.cellPresentations.count - 1) {
            viewModel.search(by: nil)
        }
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        self.searchController.searchBar.resignFirstResponder()
    }
}

// MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

        if searchController.searchBar.text?.count == .zero {
            presentation.update(with: [])
            tableView.reloadData()
            return
        }

        viewModel.resetPagination()
        viewModel.search(by: searchController.searchBar.text)
    }
}
