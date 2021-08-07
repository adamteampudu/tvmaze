//
//  ShowsRemoteDataSourceImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct ShowsRemoteDataSourceImpl: ShowsRemoteDataSource {

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func getShows(onCompletion: @escaping (ApiResult<[ApiShow]>) -> Void) {
        networkManager.requestNoParams(
            endpoint: ServerConstants.Shows.shows,
            method: .get,
            onCompletion: onCompletion
        )
    }

}
