//
//  ShowsLocalDataSourceImplTests.swift
//  TVMazeTests
//
//  Created by Adam Teale on 08-08-21.
//

import XCTest
import Cuckoo
@testable import TVMaze

final class ShowsLocalDataSourceImplTests: XCTestCase {

    private let localStorage = MockLocalStorage()
    private var sut: ShowsLocalDataSourceImpl!

    private let expectedFavorites = [1, 2, 3]

    override func setUp() {
        sut = ShowsLocalDataSourceImpl(localStorage: localStorage)

        stub(localStorage) { stub in
            when(
                stub.load(
                    key: KeychainKeys.favorites.rawValue
                )
            )
            .thenReturn(expectedFavorites)

            when(
                stub.save(
                    any(Array<Int>.self),
                    key: KeychainKeys.favorites.rawValue,
                    useAuthentication: false
                )
            ).thenReturn(true)
        }

    }

    func test_updateShowIdAsFavorite() {

        // Arrange
        let showId = Int.random(in: 0...10)
        let isFavorite = false

        // Act
        let result = sut.update(showId: showId, asFavorite: isFavorite)

        // Assert
        XCTAssertTrue(result)
    }

    func test_getFavorites() {

        // Arrange

        // Act
        let favorites = sut.getFavorites()

        // Assert
        XCTAssertEqual(expectedFavorites, favorites)

    }
}
