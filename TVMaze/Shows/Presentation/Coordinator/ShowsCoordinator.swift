//
//  ShowsCoordinator.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class ShowsCoordinator: Coordinator {

    enum GoToScene {
        case popToWelcomeScreen
        case pushToShowDetail(ShowDetailViewArgs)
    }

    func goToScene(_ scene: GoToScene, from viewController: UIViewController) {
        switch scene {
        case .popToWelcomeScreen:
            debugPrint("pop")
        case let .pushToShowDetail(args):
            pushViewController(
                viewController: viewController,
                newViewControllerType: ShowDetailViewController.self,
                args: [args])
        }
    }

}
