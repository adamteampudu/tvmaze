//
//  Episode.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

struct Episode: Equatable {
    let id: Int
    let url: URL
    let name: String
    let season: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp : String?
    let runtime: Int?
    let image: Image?
    let summary: String?
    let links: Links?
}

