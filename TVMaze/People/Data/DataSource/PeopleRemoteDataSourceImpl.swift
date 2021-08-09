//
//  PeopleRemoteDataSourceImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct PeopleRemoteDataSourceImpl: PeopleRemoteDataSource {

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func searchPeople(
        name: String,
        onCompletion: @escaping (ApiResult<[ApiPersonResult]>) -> Void
    ) {
        networkManager.requestNoParams(
            endpoint: String(format: ServerConstants.Search.people, String(name)),
            method: .get,
            onCompletion: onCompletion
        )
    }

    func getPerson(
        id: Int,
        onCompletion: @escaping (ApiResult<ApiPerson>) -> Void
    ) {
        networkManager.requestNoParams(
            endpoint: String(format: ServerConstants.People.person, String(id)),
            method: .get,
            onCompletion: onCompletion
        )
    }

    func getPersonCast(
        id: Int,
        onCompletion: @escaping (ApiResult<[ApiCast]>) -> Void
    ) {
        networkManager.requestNoParams(
            endpoint: String(format: ServerConstants.People.cast, String(id)),
            method: .get,
            onCompletion: onCompletion
        )
    }

    func getPersonCrew(
        id: Int,
        onCompletion: @escaping (ApiResult<[ApiCrew]>) -> Void
    ) {
        networkManager.requestNoParams(
            endpoint: String(format: ServerConstants.People.crew, String(id)),
            method: .get,
            onCompletion: onCompletion
        )
    }

}
