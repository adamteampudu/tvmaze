//
//  ShowsCoordinator.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class ShowsCoordinator: Coordinator {

    enum GoToScene {
        case pushToShowDetail(ShowDetailViewArgs)
        case pushToShowEpisode(ShowEpisodeViewArgs)
    }

    func goToScene(_ scene: GoToScene, from viewController: UIViewController) {
        switch scene {
        case let .pushToShowDetail(args):
            pushViewController(
                viewController: viewController,
                newViewControllerType: ShowDetailViewController.self,
                args: [args])
        case let .pushToShowEpisode(args):
            pushViewController(
                viewController: viewController,
                newViewControllerType: ShowEpisodeViewController.self,
                args: [args])
        }
    }

}
