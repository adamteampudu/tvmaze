//
//  ApiResult+Extension.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import Foundation

extension ApiResult {
    func map<R>(_ transform: (T) -> R) -> ApiResult<R> {
        switch self {
        case .success(data: let data):
            return ApiResult<R>.success(data: transform(data))
        case .error(let error):
            return ApiResult<R>.error(error: error)
        }
    }
}
