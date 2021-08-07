//
//  GetSeasonsUseCase.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

final class GetSeasonsUseCase: ClosureUseCase {

    typealias RequestType = Int
    typealias ResultType = [UiEpisode]
    typealias Alias = AnyClosureUseCase<RequestType, ResultType>

    private let repository: ShowsDataSource
    private let mapper: ShowsDomainMapper

    init(repository: ShowsDataSource,
         mapper: ShowsDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(
        _ parameters: Int,
        _ onCompletion: @escaping (ApiResult<[UiEpisode]>
        ) -> Void) {
        repository.getShowSeasons(showId: parameters) { [mapper] in
            onCompletion($0.map(mapper.mapToPresentation))
        }
    }
}
