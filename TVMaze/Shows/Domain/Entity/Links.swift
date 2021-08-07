//
//  Links.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct Links: Decodable, Equatable {
    let linksSelf: NextEpisode?
    let previousepisode: NextEpisode?
    let nextepisode: NextEpisode?
}
