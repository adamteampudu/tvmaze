//
//  ShowsDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol ShowsDataSource {

    func getShows(onCompletion: @escaping (ApiResult<[Show]>) -> Void)
    func getShowSeasons(showId: Int, onCompletion: @escaping (ApiResult<[Episode]>) -> Void)
    func update(showId: Int, asFavorite: Bool)
    func getFavorites() -> [Int]
}
