//
//  ApiSchedule.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

struct ApiSchedule: Decodable {
    let time: String?
    let days: [String]?
}
