//
//  PeopleRemoteDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol PeopleRemoteDataSource {
    func searchPeople(
        name: String,
        onCompletion: @escaping (ApiResult<[ApiPersonResult]>) -> Void
    )
    func getPerson(
        id: Int,
        onCompletion: @escaping (ApiResult<ApiPerson>) -> Void
    )
    func getPersonCast(
        id: Int,
        onCompletion: @escaping (ApiResult<[ApiCast]>) -> Void
    )
    func getPersonCrew(
        id: Int,
        onCompletion: @escaping (ApiResult<[ApiCrew]>) -> Void
    )
}
