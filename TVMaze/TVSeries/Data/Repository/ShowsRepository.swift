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
                let x = mapper.mapToDomain
                onCompletion($0.map(x))
            }
        )
    }

}
