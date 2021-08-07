//
//  WelcomeModule.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

final class WelcomeModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        // Data

        // Domain

        // Presentation

        container.register(WelcomeCoordinator.self) { _ in
            WelcomeCoordinator(container: self.container)
        }

        container.register(WelcomeViewModel.self) { _ in
            WelcomeViewModel()
        }

        container.register(WelcomeViewController.self) { resolver in
            WelcomeViewController(
                resolver.resolve(WelcomeCoordinator.self)!,
                resolver.resolve(WelcomeViewModel.self)!
            )
        }
    }
}
