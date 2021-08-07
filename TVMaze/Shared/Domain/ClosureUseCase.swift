//
//  ClosureUseCase.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

protocol ClosureUseCase: Reusable {

    associatedtype RequestType
    associatedtype ResultType

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    )
}

