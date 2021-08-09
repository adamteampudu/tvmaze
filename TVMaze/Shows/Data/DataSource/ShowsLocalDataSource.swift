//
//  ShowsLocalDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

protocol ShowsLocalDataSource {
    func update(showId: Int, asFavorite: Bool) -> Bool
    func getFavorites() -> [Int]
}
