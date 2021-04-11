//
//  SearchViewModelTests.swift
//  df-movies-catalog-iosTests
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import XCTest
@testable import df_movies_catalog_ios

class SearchViewModelTests: XCTestCase {

    private let viewModel = SearchViewModel()

    func testResetPagination() {

        viewModel.resetPagination()

        XCTAssert(viewModel.state.currentPage == 1, "currentPage failed after reset")
        XCTAssert(viewModel.state.totalPageCount == 1, "totalPageCount failed after reset")
        XCTAssert(viewModel.state.isFetching == false, "isFetching failed after reset")
        XCTAssert(viewModel.state.didFetchInitialContent == false, "didFetchInitialContent failed after reset")
    }

    func testSearch() {

        viewModel.search(by: "Wall Street")
        XCTAssert(viewModel.state.isFetching, "Fetching status is wrong!")
        XCTAssertFalse(viewModel.state.latestSearch.isEmpty, "Failed to set latest search!")
        sleep(3)
        XCTAssert(viewModel.state.movies.count > .zero, "Search API can't fetch movies!")
        XCTAssertTrue(viewModel.state.didFetchInitialContent, "Fetch initial content status is wrong!")
        XCTAssertFalse(viewModel.state.isFetching, "Is fetching status is wrong!")
    }
}
