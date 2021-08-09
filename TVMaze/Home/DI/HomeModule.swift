//
//  HomeModule.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation
import Swinject

final class HomeModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        // Data

        // Domain
        container.register(HomeTabBarViewModel.self) { _ in
            HomeTabBarViewModel()
        }

        // Presentation

        container.register(HomeTabBarController.self) { resolver in
            HomeTabBarController(
                showsListViewController: resolver.resolve(ShowsListViewController.self)!,
                peopleListViewController: resolver.resolve(PeopleListViewController.self)!,
                viewModel: resolver.resolve(HomeTabBarViewModel.self)!
            )
        }
    }
}
