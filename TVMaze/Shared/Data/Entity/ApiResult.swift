//
//  ApiResult.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

enum ApiResult<T> {
    case success(data: T)
    case error(error: ErrorType)
}
