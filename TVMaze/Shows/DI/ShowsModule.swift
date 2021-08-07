//
//  ShowsModule.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

struct ShowsModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {

        // Data

        container.register(ShowsLocalDataSource.self) { resolver in
            ShowsLocalDataSourceImpl(
                localStorage: resolver.resolve(UserDefaultsLocalStorage.self)!
            )
        }

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
                remoteDataSource: resolver.resolve(ShowsRemoteDataSource.self)!,
                localDataSource: resolver.resolve(ShowsLocalDataSource.self)!
            )
        }

        // Domain

        container.register(ShowsDomainMapper.self) { _ in
            ShowsDomainMapperImpl()
        }

        container.register(
            GetFavoritesUseCase.Alias.self,
            name: GetFavoritesUseCase.identifier
        ) { resolver in
            GetFavoritesUseCase.Alias(
                GetFavoritesUseCase(
                    repository: resolver.resolve(ShowsDataSource.self)!
                )
            )
        }

        container.register(
            UpdateShowAsFavoriteUseCase.Alias.self,
            name: UpdateShowAsFavoriteUseCase.identifier
        ) { resolver in
            UpdateShowAsFavoriteUseCase.Alias(
                UpdateShowAsFavoriteUseCase(
                    repository: resolver.resolve(ShowsDataSource.self)!
                )
            )
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

        container.register(
            GetSeasonsUseCase.Alias.self,
            name: GetSeasonsUseCase.identifier
        ) { resolver in
            GetSeasonsUseCase.Alias(
                GetSeasonsUseCase(
                    repository: resolver.resolve(ShowsDataSource.self)!,
                    mapper: resolver.resolve(ShowsDomainMapper.self)!
                )
            )
        }

        // Presentation

        container.register(ShowsCoordinator.self) { _ in
            ShowsCoordinator(container: self.container)
        }

        container.register(ShowsListViewModel.self) { resolver in
            ShowsListViewModel(
                getShowsUseCase: resolver.resolve(
                    GetShowsUseCase.Alias.self,
                    name: GetShowsUseCase.identifier
                )!
            )
        }

        container.register(ShowsListViewController.self) { resolver in
            ShowsListViewController(
                resolver.resolve(ShowsCoordinator.self)!,
                resolver.resolve(ShowsListViewModel.self)!
            )
        }

        container.register(ShowDetailViewModel.self) { (resolver, args: ShowDetailViewArgs) in
            ShowDetailViewModel(
                getSeasonsUseCase: resolver.resolve(
                    GetSeasonsUseCase.Alias.self,
                    name: GetSeasonsUseCase.identifier
                )!,
                getFavoritesUseCase: resolver.resolve(
                    GetFavoritesUseCase.Alias.self,
                    name: GetFavoritesUseCase.identifier
                )!,
                updateShowAsFavoriteUseCase: resolver.resolve(
                    UpdateShowAsFavoriteUseCase.Alias.self,
                    name: UpdateShowAsFavoriteUseCase.identifier
                )!,
                args: args
            )
        }

        container.register(ShowDetailViewController.self) { (resolver, args: ShowDetailViewArgs) in
            ShowDetailViewController(
                resolver.resolve(ShowsCoordinator.self)!,
                resolver.resolve(
                    ShowDetailViewModel.self,
                    argument: args
                )!
            )
        }

        container.register(ShowEpisodeViewModel.self) { (_, args: ShowEpisodeViewArgs) in
            ShowEpisodeViewModel(args: args)
        }

        container.register(ShowEpisodeViewController.self) { (resolver, args: ShowEpisodeViewArgs) in
            ShowEpisodeViewController(
                resolver.resolve(ShowsCoordinator.self)!,
                resolver.resolve(
                    ShowEpisodeViewModel.self,
                    argument: args
                )!
            )
        }

    }
}
