//
//  ApiEpisode.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

struct ApiEpisode: Decodable, Equatable {
    let id: Int
    let url: URL
    let name: String
    let season: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp : String?
    let runtime: Int?
    let image: ApiImage?
    let summary: String?
    let links: ApiLinks?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case season
        case type
        case airdate
        case airtime
        case airstamp
        case runtime
        case image
        case summary
        case links = "linksSelf"
    }

}

