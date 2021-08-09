//
//  ApiPersonCrewLinks.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct ApiPersonCrewLinks: Decodable, Equatable {
    let show: ApiCharacter
    let character: ApiCharacter
}
