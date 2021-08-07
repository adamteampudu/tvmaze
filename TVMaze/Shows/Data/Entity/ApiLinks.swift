//
//  ApiLinks.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct ApiLinks: Decodable, Equatable {
    let linksSelf: ApiNextEpisode
    let previousepisode: ApiNextEpisode?
    let nextepisode: ApiNextEpisode?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode
        case nextepisode
    }
}
