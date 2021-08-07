//
//  ApiCountry.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct ApiCountry: Decodable {
    let name: String
    let code: String
    let timezone: String
}
