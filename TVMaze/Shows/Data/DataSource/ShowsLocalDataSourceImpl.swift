//
//  ShowsLocalDataSourceImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

class ShowsLocalDataSourceImpl: ShowsLocalDataSource {

    private let localStorage: LocalStorage

    init(localStorage: LocalStorage) {
        self.localStorage = localStorage
    }

    func update(showId: Int, asFavorite: Bool) {
        var favorites = Set(getFavorites())
        if asFavorite {
            favorites.insert(showId)
        } else {
            favorites.remove(showId)
        }
        _ = localStorage.save(
            Array(favorites),
            key: KeychainKeys.favorites.rawValue,
            useAuthentication: false
        )
    }

    func getFavorites() -> [Int] {
        if let favorites: [Int] = localStorage.load(key: KeychainKeys.favorites.rawValue) {
            return favorites
        } else {
            return []
        }
    }

}
