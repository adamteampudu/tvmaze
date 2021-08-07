//
//  AnyClosureUseCase.swift
//
//  Created by Daniel Santamaria on 10/23/20.
//

import Foundation

class AnyClosureUseCase<RequestType, ResultType>: ClosureUseCase {

    private let call: (RequestType, @escaping (ApiResult<ResultType>) -> Void) -> Void

    init<T: ClosureUseCase>(_ useCase: T) where
        T.RequestType == RequestType,
        T.ResultType == ResultType {
        call = useCase.execute
    }

    func execute(
        _ parameters: RequestType,
        _ onCompletion: @escaping (ApiResult<ResultType>) -> Void
    ) {
        call(parameters, onCompletion)
    }
}
