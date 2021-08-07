//
//  UiEpisode.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

struct UiEpisode: Equatable {
    let id: Int
    let url: URL
    let name: String
    let season: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp : String?
    let runtime: Int?
    let image: UiImage?
    let summary: String?
    let links: UiLinks?
}
