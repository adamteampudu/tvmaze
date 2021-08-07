//
//  UpdateShowAsFavoriteUseCase.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

final class UpdateShowAsFavoriteUseCase: UseCase {

    typealias RequestType = UpdateShowAsFavoriteEntity //showId
    typealias ResultType = Void

    typealias Alias = AnyUseCase<RequestType, ResultType>

    private let repository: ShowsDataSource

    init(repository: ShowsDataSource) {
        self.repository = repository
    }

    func execute(_ parameters: RequestType) -> ApiResult<ResultType> {
        .success(
            data: repository.update(
                showId: parameters.showId,
                asFavorite: parameters.favorite
            )
        )
    }

}
