//
//  GetPersonUseCase.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

final class GetPersonUseCase: ClosureUseCase {

    typealias RequestType = Int
    typealias ResultType = UiPerson
    typealias Alias = AnyClosureUseCase<RequestType, ResultType>

    private let repository: PeopleDataSource
    private let mapper: PeopleDomainMapper

    init(repository: PeopleDataSource,
         mapper: PeopleDomainMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    func execute(
        _ parameters: Int,
        _ onCompletion: @escaping (ApiResult<UiPerson>
        ) -> Void) {
        repository.getPerson(id: parameters) { [mapper] in
            onCompletion($0.map(mapper.mapToPresentation))
        }
    }
}
