//
//  PeopleCoordinator.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class PeopleCoordinator: Coordinator {

    enum GoToScene {
        case pushToPersonDetail(PersonDetailViewArgs)
        case pushToShowDetail(ShowDetailViewArgs)
    }

    func goToScene(_ scene: GoToScene, from viewController: UIViewController) {
        switch scene {
        case let .pushToPersonDetail(args):
            pushViewController(
                viewController: viewController,
                newViewControllerType: PersonDetailViewController.self,
                args: [args])
        case let .pushToShowDetail(args):
            pushViewController(
                viewController: viewController,
                newViewControllerType: ShowDetailViewController.self,
                args: [args])
        }
    }

}
