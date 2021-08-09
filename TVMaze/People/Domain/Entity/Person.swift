//
//  Person.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct Person: Equatable {
    let id: Int
    let url: String
    let name: String
    let country: Country?
    let birthday: String?
    let deathday: String?
    let gender: String?
    let image: Image?
    let links: Links
}


struct PersonResult: Equatable {
    let score: Double
    let person: Person
}
