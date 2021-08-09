//
//  WelcomeCoordinator.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class WelcomeCoordinator: Coordinator {

    enum GoToScene {
        case seriesList
    }

    func goToScene(_ scene: GoToScene, from viewController: UIViewController) {
        switch scene {
        case .seriesList:
            goToSeriesList(from: viewController)
        }
    }

    func goToSeriesList(from viewController: UIViewController) {
        pushViewController(
            viewController: viewController,
            newViewControllerType: HomeTabBarController.self
        )
    }
}
