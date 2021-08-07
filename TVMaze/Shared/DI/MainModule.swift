//
//  MainModule.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject
import LocalAuthentication

class MainModule {

    private let container: Container
    private static let mainBundleServiceName = "mainBundle"

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

        container.register(LAContext.self) { _ in
            LAContext()
        }

        container.register(Bundle.self, name: Self.mainBundleServiceName) { _ in
            Bundle.main
        }.inObjectScope(.container)

        container.register(UIDevice.self) { _ in
            UIDevice.current
        }.inObjectScope(.container)

        container.register(LocalStorage.self) { resolver in
            KeychainLocalStorageImpl(
                context: resolver.resolve(LAContext.self)!,
                bundle: resolver.resolve(Bundle.self, name: Self.mainBundleServiceName)!,
                device: resolver.resolve(UIDevice.self)!
            )
        }.inObjectScope(.container)

        container.register(UserDefaults.self) { _ in
            UserDefaults.standard
        }

        container.register(UserDefaultsLocalStorage.self) { resolver in
            UserDefaultsLocalStorageImpl(
                userDefaults: resolver.resolve(UserDefaults.self)!
            )
        }
    }

    func getNavigationController() -> UINavigationController {
        return container.resolve(UINavigationController.self)!
    }

}
