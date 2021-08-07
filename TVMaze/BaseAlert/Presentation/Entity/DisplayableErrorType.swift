//
//  DisplayableErrorType.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

enum DisplayableErrorType: Equatable {
    case serverError(code: Int? = nil, message: String? = nil)
    case connectionError
}
