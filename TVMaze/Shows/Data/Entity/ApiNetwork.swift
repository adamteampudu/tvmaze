//
//  ApiNetwork.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct ApiNetwork: Decodable, Equatable {
    let id: Int
    let name: String
    let country: ApiCountry?
}
