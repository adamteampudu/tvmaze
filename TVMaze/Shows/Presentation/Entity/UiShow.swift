//
//  UiShow.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct UiShow: Decodable {
    let id: Int
    let url: URL
    let name: String
    let image: UiImage?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: UiSchedule?
    let rating: UiRating?
    let weight: Int?
    let network: UiNetwork?
    let webChannel: UiNetwork?
    let externals: UiExternals?
    let summary: String?
    let updated: Int?
    let links: UiLinks?
}
