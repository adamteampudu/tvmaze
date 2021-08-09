//
//  Injection.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import Swinject

final class Injection {

    static let shared = Injection()

    private let container = Container()
    private let mainModule: MainModule

    private init() {
        mainModule = MainModule(container)
        injectDependencies()
    }

    private func injectDependencies() {
        mainModule.inject()
        NetworkModule(container).inject()
        ShowsModule(container).inject()
        WelcomeModule(container).inject()
        HomeModule(container).inject()
        PeopleModule(container).inject()
        mainModule.inject()
    }

    func getNavigationController() -> UINavigationController {
        return mainModule.getNavigationController()
    }

}
