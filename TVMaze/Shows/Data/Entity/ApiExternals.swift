//
//  ApiExternals.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct ApiExternals: Decodable, Equatable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}
