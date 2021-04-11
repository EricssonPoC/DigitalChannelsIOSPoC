//
//  SearchViewModel.swift
//  df-movies-catalog-ios
//
//  Created by Yusuf Miletli on 9.04.2021.
//

import Foundation

// MARK: - SearchState

struct SearchState {

    enum Change: StateChange {

        case loading
        case loaded(movies: [Movie])
        case failed(error: String)
    }

    var nextPage: Int {
        return currentPage == totalPageCount ? currentPage : (currentPage + 1)
    }
    var currentPage = 1
    var totalPageCount = 1
    var isFetching = false
    var didFinishPaginating: Bool {
        return (currentPage == totalPageCount) && didFetchInitialContent
    }
    var didFetchInitialContent = false
    var latestSearch: String = ""
    var movies: [Movie] = []
}

// MARK: - SearchViewModel

class SearchViewModel: StatefulViewModel<SearchState.Change> {

    var state = SearchState()

    func resetPagination() {

        state.currentPage = 1
        state.totalPageCount = 1
        state.isFetching = false
        state.didFetchInitialContent = false
    }

    func search(by movieName: String?) {

        guard !state.isFetching,
            !state.didFinishPaginating,
            state.nextPage <= state.totalPageCount else { return }

        state.isFetching = true

        if state.nextPage == .zero {
            emit(change: .loading)
        }

        let request: SearchMovieRequest

        if let name = movieName {
            state.latestSearch = name
            request = SearchMovieRequest(page: 1, movieName: name)
        } else {
            request = SearchMovieRequest(page: state.nextPage, movieName: state.latestSearch)
        }

        NetworkManager.shared.request(request: request) { [weak self] (response: SearchMovieResponse?, error) in

            if let err = error {
                self?.emit(change: .failed(error: err))
                return
            }

            self?.state.currentPage = response?.page ?? .zero
            self?.state.totalPageCount = response?.numberOfPages ?? .zero
            if self?.state.currentPage == 1 {
                self?.state.movies = response?.movies ?? []
            } else {
                self?.state.movies.append(contentsOf: response?.movies ?? [])
            }
            self?.emit(change: .loaded(movies: self?.state.movies ?? []))

            self?.state.isFetching = false
            self?.state.didFetchInitialContent = true
        }
    }
}
