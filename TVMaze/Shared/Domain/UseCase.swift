//
//  UseCase.swift
//
//  Created by Daniel Santamaria on 10/1/20.
//

import Foundation

protocol UseCase: Reusable {

    associatedtype RequestType
    associatedtype ResultType

    func execute(_ parameters: RequestType) -> ApiResult<ResultType>
}
