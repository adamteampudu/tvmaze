//
//  ApiShow.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct ApiShow: Decodable, Equatable {
    let id: Int
    let url: URL
    let name: String
    let image: ApiImage?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: ApiSchedule?
    let rating: ApiRating?
    let weight: Int?
    let network: ApiNetwork?
    let webChannel: ApiNetwork?
    let externals: ApiExternals?
    let summary: String?
    let updated: Int?
    let links: ApiLinks?
}
