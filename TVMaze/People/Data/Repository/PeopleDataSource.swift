//
//  PeopleDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol PeopleDataSource {
    func searchPeople(
        name: String,
        onCompletion: @escaping (ApiResult<[Person]>) -> Void
    )
    func getPerson(
        id: Int,
        onCompletion: @escaping (ApiResult<Person>) -> Void
    )
    func getPersonCast(
        id: Int,
        onCompletion: @escaping (ApiResult<[Cast]>) -> Void
    )
    func getPersonCrew(
        id: Int,
        onCompletion: @escaping (ApiResult<[Crew]>) -> Void
    )
}
