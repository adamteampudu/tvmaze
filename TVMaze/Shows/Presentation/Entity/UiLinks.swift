//
//  UiLinks.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct UiLinks: Decodable, Equatable {
    let linksSelf: UiNextEpisode?
    let previousepisode: UiNextEpisode?
    let nextepisode: UiNextEpisode?
}
