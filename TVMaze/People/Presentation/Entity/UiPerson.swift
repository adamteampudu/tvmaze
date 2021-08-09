//
//  UiPerson.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct UiPerson: Equatable {
    let id: Int
    let url: String
    let name: String
    let country: UiCountry?
    let birthday: String?
    let deathday: String?
    let gender: String?
    let image: UiImage?
    let links: UiLinks
}


struct UiPersonResult: Equatable {
    let score: Double
    let person: UiPerson
}
