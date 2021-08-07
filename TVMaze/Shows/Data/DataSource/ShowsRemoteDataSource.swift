//
//  ShowsRemoteDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol ShowsRemoteDataSource {
    func getShows(onCompletion: @escaping (ApiResult<[ApiShow]>) -> Void)
    func getShowSeasons(showId: Int, onCompletion: @escaping (ApiResult<[ApiEpisode]>) -> Void)
}
