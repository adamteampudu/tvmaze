//
//  GetFavoritesUseCase.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

final class GetFavoritesUseCase: UseCase {

    typealias RequestType =  Void?
    typealias ResultType = [Int]

    typealias Alias = AnyUseCase<RequestType, ResultType>

    private let repository: ShowsDataSource

    init(repository: ShowsDataSource) {
        self.repository = repository
    }

    func execute(_ parameters: RequestType) -> ApiResult<ResultType> {
        .success(data: repository.getFavorites())
    }
}
