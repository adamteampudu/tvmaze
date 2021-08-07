//
//  MainModule.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

class MainModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {

        container.register(UINavigationController.self) { resolver in
            UINavigationController(
                rootViewController: resolver.resolve(WelcomeViewController.self)!
            )
        }

        container.register(Coordinator.self) { _ in
            Coordinator(container: self.container)
        }

    }

    func getNavigationController() -> UINavigationController {
        return container.resolve(UINavigationController.self)!
    }

}
