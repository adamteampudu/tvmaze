//
//  PeopleModule.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

struct PeopleModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {

        // Data

        container.register(PeopleRemoteDataSource.self) { resolver in
            PeopleRemoteDataSourceImpl(
                networkManager: resolver.resolve(NetworkManager.self)!
            )
        }

        container.register(PeopleDataMapper.self) { _ in
            PeopleDataMapperImpl()
        }

        container.register(PeopleRemoteDataSource.self) { resolver in
            PeopleRemoteDataSourceImpl(
                networkManager: resolver.resolve(NetworkManager.self)!
            )
        }

        container.register(PeopleDataSource.self) { resolver in
            PeopleRepository(
                mapper: resolver.resolve(PeopleDataMapper.self)!,
                remoteDataSource: resolver.resolve(PeopleRemoteDataSource.self)!
            )
        }

        // Domain

        container.register(PeopleDomainMapper.self) { _ in
            PeopleDomainMapperImpl()
        }

        container.register(
            GetPeopleUseCase.Alias.self,
            name: GetPeopleUseCase.identifier
        ) { resolver in
            GetPeopleUseCase.Alias(
                GetPeopleUseCase(
                    repository: resolver.resolve(PeopleDataSource.self)!,
                    mapper: resolver.resolve(PeopleDomainMapper.self)!
                )
            )
        }

        container.register(
            GetPersonUseCase.Alias.self,
            name: GetPersonUseCase.identifier
        ) { resolver in
            GetPersonUseCase.Alias(
                GetPersonUseCase(
                    repository: resolver.resolve(PeopleDataSource.self)!,
                    mapper: resolver.resolve(PeopleDomainMapper.self)!
                )
            )
        }

        container.register(
            GetPersonCastUseCase.Alias.self,
            name: GetPersonCastUseCase.identifier
        ) { resolver in
            GetPersonCastUseCase.Alias(
                GetPersonCastUseCase(
                    repository: resolver.resolve(PeopleDataSource.self)!,
                    mapper: resolver.resolve(PeopleDomainMapper.self)!
                )
            )
        }

        container.register(
            GetPersonCrewUseCase.Alias.self,
            name: GetPersonCrewUseCase.identifier
        ) { resolver in
            GetPersonCrewUseCase.Alias(
                GetPersonCrewUseCase(
                    repository: resolver.resolve(PeopleDataSource.self)!,
                    mapper: resolver.resolve(PeopleDomainMapper.self)!
                )
            )
        }


        // Presentation

        container.register(PeopleCoordinator.self) { _ in
            PeopleCoordinator(container: self.container)
        }

        container.register(PeopleListViewModel.self) { resolver in
            PeopleListViewModel(
                getPeopleUseCase: resolver.resolve(
                    GetPeopleUseCase.Alias.self,
                    name: GetPeopleUseCase.identifier
                )!
            )
        }

        container.register(PeopleListViewController.self) { resolver in
            PeopleListViewController(
                resolver.resolve(PeopleCoordinator.self)!,
                resolver.resolve(PeopleListViewModel.self)!
            )
        }

        container.register(PersonDetailViewModel.self) { (resolver, args: PersonDetailViewArgs) in
            PersonDetailViewModel(
                getPersonUseCase: resolver.resolve(
                    GetPersonUseCase.Alias.self,
                    name: GetPersonUseCase.identifier
                )!,
                getPersonCastUseCase: resolver.resolve(
                    GetPersonCastUseCase.Alias.self,
                    name: GetPersonCastUseCase.identifier
                )!,
                getPersonCrewUseCase: resolver.resolve(
                    GetPersonCrewUseCase.Alias.self,
                    name: GetPersonCrewUseCase.identifier
                )!,
                args: args
            )
        }

        container.register(PersonDetailViewController.self) { (resolver, args: PersonDetailViewArgs) in
            PersonDetailViewController(
                resolver.resolve(PeopleCoordinator.self)!,
                resolver.resolve(
                    PersonDetailViewModel.self,
                    argument: args
                )!
            )
        }

    }
}
