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

    init(mapper: ShowsDataMapper,
         remoteDataSource: ShowsRemoteDataSource) {
        self.mapper = mapper
        self.remoteDataSource = remoteDataSource
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
}
