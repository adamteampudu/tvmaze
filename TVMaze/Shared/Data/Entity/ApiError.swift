//
//  ApiError.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

struct ApiError: Decodable {

    let code: Int?
    let error: String?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case code = "errorCode"
        case error
        case message
    }
}
