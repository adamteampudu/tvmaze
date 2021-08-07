//
//  ApiLinks.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct ApiLinks: Decodable {
    let linksSelf: ApiNextEpisode
    let previousepisode: ApiNextEpisode?
    let nextepisode: ApiNextEpisode?
}
