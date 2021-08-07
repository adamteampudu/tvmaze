//
//  ShowsRepository.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

class ShowsRepository: ShowsDataSource {

    private let mapper: ShowsDataMapper
    private let remoteDataSource: ShowsRemoteDataSource
    private let localDataSource: ShowsLocalDataSource

    init(mapper: ShowsDataMapper,
         remoteDataSource: ShowsRemoteDataSource,
         localDataSource: ShowsLocalDataSource) {
        self.mapper = mapper
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func getShows(onCompletion: @escaping (ApiResult<[Show]>) -> Void) {
        remoteDataSource.getShows(
            onCompletion: { [mapper] in
                onCompletion($0.map(mapper.mapToDomain))
            }
        )
    }

    func getShowSeasons(showId: Int, onCompletion: @escaping (ApiResult<[Episode]>) -> Void) {
        remoteDataSource.getShowSeasons(showId: showId) { [mapper] in
            onCompletion($0.map(mapper.mapToDomain))
        }
    }

    func update(showId: Int, asFavorite: Bool) {
        localDataSource.update(showId: showId, asFavorite: asFavorite)
    }

    func getFavorites() -> [Int] {
        localDataSource.getFavorites()
    }
}
