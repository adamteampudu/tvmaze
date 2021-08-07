//
//  TVSeriesModule.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

struct TVSeriesModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {

        // Data

        container.register(ShowsRemoteDataSource.self) { resolver in
            ShowsRemoteDataSourceImpl(
                networkManager: resolver.resolve(NetworkManager.self)!
            )
        }

        container.register(ShowsDataMapper.self) { _ in
            ShowsDataMapperImpl()
        }

        container.register(ShowsRemoteDataSource.self) { resolver in
            ShowsRemoteDataSourceImpl(
                networkManager: resolver.resolve(NetworkManager.self)!
            )
        }

        container.register(ShowsDataSource.self) { resolver in
            ShowsRepository(
                mapper: resolver.resolve(ShowsDataMapper.self)!,
                remoteDataSource: resolver.resolve(ShowsRemoteDataSource.self)!
            )
        }

        // Domain

        container.register(ShowsDomainMapper.self) { _ in
            ShowsDomainMapperImpl()
        }

        container.register(
            GetShowsUseCase.Alias.self,
            name: GetShowsUseCase.identifier
        ) { resolver in
            GetShowsUseCase.Alias(
                GetShowsUseCase(
                    repository: resolver.resolve(ShowsDataSource.self)!,
                    mapper: resolver.resolve(ShowsDomainMapper.self)!
                )
            )
        }

        // Presentation

        container.register(TVSeriesCoordinator.self) { _ in
            TVSeriesCoordinator(container: self.container)
        }

        container.register(TVSeriesListViewModel.self) { resolver in
            TVSeriesListViewModel(
                getTVSeriesUseCase: resolver.resolve(
                    GetShowsUseCase.Alias.self,
                    name: GetShowsUseCase.identifier
                )!
            )
        }

        container.register(TVSeriesListViewController.self) { resolver in
            TVSeriesListViewController(
                resolver.resolve(TVSeriesCoordinator.self)!,
                resolver.resolve(TVSeriesListViewModel.self)!
            )
        }
    }
}
