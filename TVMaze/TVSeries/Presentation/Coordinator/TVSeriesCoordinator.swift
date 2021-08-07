//
//  TVSeriesCoordinator.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class TVSeriesCoordinator: Coordinator {

    enum GoToScene {
        case popToWelcomeScreen
        case pushToTVShowDetail
    }

    func goToScene(_ scene: GoToScene, from viewController: UIViewController) {
        switch scene {
        case .popToWelcomeScreen:
            debugPrint("pop")
        case .pushToTVShowDetail:
            debugPrint("pushToTVShowDetail")
        }
    }

}
