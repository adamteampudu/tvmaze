//
//  PeopleRepository.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

class PeopleRepository: PeopleDataSource {

    private let mapper: PeopleDataMapper
    private let remoteDataSource: PeopleRemoteDataSource

    init(mapper: PeopleDataMapper,
         remoteDataSource: PeopleRemoteDataSource
    ) {
        self.mapper = mapper
        self.remoteDataSource = remoteDataSource
    }

    func searchPeople(
        name: String,
        onCompletion: @escaping (ApiResult<[Person]>) -> Void
    ) {
        remoteDataSource.searchPeople(
            name: name,
            onCompletion: { [mapper] in
                onCompletion($0.map(mapper.mapToDomain))
            }
        )
    }

    func getPerson(
        id: Int,
        onCompletion: @escaping (ApiResult<Person>) -> Void
    ) {
        remoteDataSource.getPerson(
            id: id,
            onCompletion: { [mapper] in
                onCompletion($0.map(mapper.mapToDomain))
            }
        )
    }

    func getPersonCast(id: Int, onCompletion: @escaping (ApiResult<[Cast]>) -> Void) {
        remoteDataSource.getPersonCast(
            id: id,
            onCompletion: { [mapper] in
                onCompletion($0.map(mapper.mapToDomain))
            }
        )
    }

    func getPersonCrew(id: Int, onCompletion: @escaping (ApiResult<[Crew]>) -> Void) {
        remoteDataSource.getPersonCrew(
            id: id,
            onCompletion: { [mapper] in
                onCompletion($0.map(mapper.mapToDomain))
            }
        )
    }
}
