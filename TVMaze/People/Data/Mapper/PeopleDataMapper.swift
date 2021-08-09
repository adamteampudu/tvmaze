//
//  PeopleDataMapper.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol PeopleDataMapper {
    func mapToDomain(_ value: [ApiPersonResult]) -> [Person]
    func mapToDomain(_ value: ApiPerson) -> Person
    func mapToDomain(_ value: [ApiCast]) -> [Cast]
    func mapToDomain(_ value: [ApiCrew]) -> [Crew]
}
