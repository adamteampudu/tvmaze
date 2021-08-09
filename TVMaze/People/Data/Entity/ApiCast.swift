//
//  ApiCast.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct ApiCast: Decodable, Equatable {
    let personCrewSelf: Bool?
    let voice: Bool?
    let links: ApiPersonCrewLinks?
    let embedded: ApiEmbeddedShow?

    enum CodingKeys: String, CodingKey {
        case personCrewSelf = "self"
        case voice
        case links = "_links"
        case embedded = "_embedded"
    }
}
