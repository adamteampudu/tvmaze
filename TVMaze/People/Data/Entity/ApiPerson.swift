//
//  ApiPerson.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct ApiPerson: Decodable, Equatable {
    let id: Int
    let url: String
    let name: String
    let country: ApiCountry?
    let birthday: String?
    let deathday: String?
    let gender: String?
    let image: ApiImage?
    let links: ApiLinks

    enum CodingKeys: String, CodingKey {
        case id, url, name, country, birthday, deathday, gender, image
        case links = "_links"
    }
}


struct ApiPersonResult: Decodable, Equatable {
    let score: Double
    let person: ApiPerson
}
