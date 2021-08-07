//
//  GetShowsUseCase.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

final class GetShowsUseCase: ClosureUseCase {
    typealias RequestType = Void
    typealias ResultType = [UiShow]
    typealias Alias = AnyClosureUseCase<RequestType, ResultType>

    private let repository: ShowsDataSource
    private let mapper: ShowsDomainMapper

    init(repository: ShowsDataSource,
         mapper: ShowsDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(
        _ parameters: Void,
        _ onCompletion: @escaping (ApiResult<[UiShow]>
        ) -> Void) {
        repository.getShows(onCompletion: { [mapper] in
            onCompletion($0.map(mapper.mapToPresentation))
        })
    }
}
