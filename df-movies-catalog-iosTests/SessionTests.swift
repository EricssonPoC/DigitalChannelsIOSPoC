//
//  SessionTests.swift
//  df-movies-catalog-iosTests
//
//  Created by Yusuf Miletli on 10.04.2021.
//

import XCTest
@testable import df_movies_catalog_ios

class SessionTests: XCTestCase {

    let dummyMovie = Movie(
        id: 162744,
        posterPath: "/1K60PlRbzDiYYgnQi91G7ermwdm.jpg",
        backdropPath: "/jRc3pQjXTlbtQ5hmr3zoWZOmrGQ.jpg",
        title: "The Wall Street Mystery",
        releaseDate: "1931-11-01",
        rating: 6.5,
        overview: "When the apparent murder of two stockbrokers are discovered in their Wall Street office. Police Inspector Crane summons forensic expert Dr. Crabtree to the crime scene. A beautiful woman found in the closet, a frightened African-American elevator operator, and a suspicious business associate are among the witnesses questioned."
    )

    func testFavoritesAdditions() {

        if Session.favorites.contains(dummyMovie) {
            Session.favorites.addOrRemoveToList(movie: dummyMovie)
            XCTAssertFalse(Session.favorites.contains(dummyMovie))
        } else {
            Session.favorites.addOrRemoveToList(movie: dummyMovie)
            XCTAssertTrue(Session.favorites.contains(dummyMovie))
        }
    }

    func testWatchlistAdditions() {

        if Session.watchList.contains(dummyMovie) {
            Session.watchList.addOrRemoveToList(movie: dummyMovie)
            XCTAssertFalse(Session.watchList.contains(dummyMovie))
        } else {
            Session.watchList.addOrRemoveToList(movie: dummyMovie)
            XCTAssertTrue(Session.watchList.contains(dummyMovie))
        }
    }
}
