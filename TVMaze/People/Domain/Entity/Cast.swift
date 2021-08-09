//
//  Cast.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation

struct Cast: Equatable {
    let personCrewSelf: Bool?
    let voice: Bool?
    let links: PersonCrewLinks?
    let embedded: EmbeddedShow?
}
