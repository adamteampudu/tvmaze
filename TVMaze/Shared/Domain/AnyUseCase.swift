//
//  AnyUseCase.swift
//
//  Created by Daniel Santamaria on 10/1/20.
//

import Foundation

class AnyUseCase<RequestType, ResultType>: UseCase {

    private let executeClosure: (RequestType) -> ApiResult<ResultType>

    init<T: UseCase>(_ useCase: T) where
        T.RequestType == RequestType,
        T.ResultType == ResultType {
        self.executeClosure = useCase.execute
    }

    func execute(_ parameters: RequestType) -> ApiResult<ResultType> {
        return self.executeClosure(parameters)
    }
}
