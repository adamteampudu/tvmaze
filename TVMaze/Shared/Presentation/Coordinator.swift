//
//  Coordinator.swift
//
//  Created by Daniel Santamaria on 10/5/20.
//

import Foundation
import Swinject

class Coordinator {

    private let container: Container

    private static let noArguments = 0
    private static let oneArgument = 1
    private static let twoArguments = 2

    private static let firstArgument = 0
    private static let secondArgument = 1

    init(container: Container) {
        self.container = container
    }

    func resolve<V: UIViewController>(type: V.Type) -> V {
        container.resolve(V.self)!
    }

    func resolve<V: UIViewController, T>(type: V.Type,
                                         with args: [T]) -> V {
        switch args.count {
        case Coordinator.noArguments:
            return container.resolve(V.self)!
        case Coordinator.oneArgument:
            return container.resolve(V.self,
                                     argument: args[Self.firstArgument])!
        case Coordinator.twoArguments:
            return container.resolve(V.self,
                                     arguments: args[Self.firstArgument],
                                     args[Self.secondArgument])!
        default:
            fatalError("Unsupported number of arguments (max. 2)")
        }
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

    func presentAlert(
        from currentViewController: UIViewController,
        args: BaseAlertViewArgs
    ) {

        //Later handle alert specific a actions/title

        let alertController = UIAlertController(
            title: L10n.whoops,
            message: L10n.tryAgainLater,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "OK",
            style: .default
        )
        alertController.addAction(action)

        currentViewController.navigationController?.present(alertController, animated: true, completion: nil)
    }

    private func getAlertController(for args: BaseAlertViewArgs) -> BaseAlertViewController {
        return BaseAlertViewController(
            args: args.contentArgs,
            presentation: args.presentation,
            onMainAction: args.onMainAction,
            onSecondaryAction: args.onSecondaryAction
        )
    }
}
