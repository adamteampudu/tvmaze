//
//  Coordinator.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

class Coordinator {

    private let container: Container

    init(container: Container) {
        self.container = container
    }

    func resolve<V: UIViewController>(type: V.Type) -> V {
        container.resolve(V.self)!
    }

    func resolve<V: UIViewController, T>(type: V.Type,
                                         with args: [T]) -> V {
        return container.resolve(V.self,
                                 arguments: args,
                                 args)!
//        switch args.count {
//        case Coordinator.noArguments:
//            return container.resolve(V.self)!
//        case Coordinator.oneArgument:
//            return container.resolve(V.self,
//                                     argument: args[Self.firstArgument])!
//        case Coordinator.twoArguments:
//            return container.resolve(V.self,
//                                     arguments: args[Self.firstArgument],
//                                     args[Self.secondArgument])!
//        default:
//            fatalError("Unsupported number of arguments (max. 2)")
//        }
    }

    func popViewController(viewController: UIViewController, animated: Bool) {
        viewController.navigationController?.popViewController(animated: animated)
    }

    func pushViewController<V: UIViewController>(
        viewController: UIViewController,
        newViewControllerType: V.Type
    ) {
        let newViewController = resolve(type: newViewControllerType)
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }

    func pushViewController<V: UIViewController, T>(
        viewController: UIViewController,
        newViewControllerType: V.Type,
        args: [T]?
    ) {
        if let args = args {
            let newViewController = resolve(type: newViewControllerType, with: args)
            viewController.navigationController?.pushViewController(newViewController, animated: true)
        } else {
            let newViewController = resolve(type: newViewControllerType)
            viewController.navigationController?.pushViewController(newViewController, animated: true)
        }
    }

//    func presentAlert(
//        from currentViewController: UIViewController,
//        args: BaseAlertViewArgs
//    ) {
//        let alertViewController = getAlertController(for: args)
//        let nav = UINavigationController(rootViewController: alertViewController)
//        nav.setNavigationBarHidden(true, animated: false)
//
//        switch args.presentation {
//        case .presentFullScreen:
//            nav.modalPresentationStyle = .fullScreen
//        case .presentPopUp:
//            nav.modalPresentationStyle = .custom
//            nav.modalTransitionStyle = .crossDissolve
//        default:
//            break
//        }
//
//        currentViewController.navigationController?.present(nav, animated: true, completion: nil)
//    }

//    private func getAlertController(for args: BaseAlertViewArgs) -> BaseAlertViewController {
//        return BaseAlertViewController(
//            args: args.contentArgs,
//            presentation: args.presentation,
//            onMainAction: args.onMainAction,
//            onSecondaryAction: args.onSecondaryAction
//        )
//    }
}
