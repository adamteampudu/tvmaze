//
//  Country.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct Country: Equatable, Decodable {
    let name: String?
    let code: String?
    let timezone: String?
}
