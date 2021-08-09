//
//  PeopleDomainMapper.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

protocol PeopleDomainMapper {
    func mapToPresentation(_ value: [Person]) -> [UiPerson]
    func mapToPresentation(_ value: Person) -> UiPerson
    func mapToPresentation(_ value: [Cast]) -> [UiCast]
    func mapToPresentation(_ value: [Crew]) -> [UiCrew]
}
