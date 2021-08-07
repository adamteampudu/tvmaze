//
//  ShowsDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol ShowsDataSource {

    func getShows(onCompletion: @escaping (ApiResult<[Show]>) -> Void)

}