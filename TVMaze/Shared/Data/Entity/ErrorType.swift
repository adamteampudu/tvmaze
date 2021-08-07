//
//  ErrorType.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

enum ErrorType: Error {
    case connection
    case api(_ apiError: ApiError)
    case general(_ error: Error? = nil)
}
