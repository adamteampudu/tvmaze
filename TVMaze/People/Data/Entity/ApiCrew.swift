//
//  ApiCrew.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct ApiCrew: Decodable, Equatable {
    let type: String?
    let links: ApiPersonCrewLinks?
    let embedded: ApiEmbeddedShow?

    enum CodingKeys: String, CodingKey {
        case type
        case links = "_links"
        case embedded = "_embedded"
    }
}
