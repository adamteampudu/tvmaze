//
//  Show.swift
//  TVMaze
//
//  Created by Adam Teale on 05-08-21.
//

import Foundation

struct Show: Equatable {
    let id: Int
    let url: URL
    let name: String
    let image: Image?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network: Network?
    let webChannel: Network?
    let externals: Externals?
    let summary: String?
    let updated: Int?
    let links: Links?
}
