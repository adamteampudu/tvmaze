//
//  AppDelegate.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return true }
        window.tintColor = Asset.Colors.primary.color
        window.rootViewController = Injection.shared.getNavigationController()
        window.makeKeyAndVisible()

        return true
    }

}
