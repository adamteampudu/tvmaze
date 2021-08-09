//
//  HomeTabBarViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import Foundation
import RxSwift

class HomeTabBarViewModel {

    let titleObservable = PublishSubject<String?>()

    func setNavigationItem(_ tag: Int) {
        guard let type = TabBarItemType(rawValue: tag) else { return }
        switch type {
        case .shows:
            titleObservable.onNext(L10n.shows)
        case .people:
            titleObservable.onNext(L10n.people)
        }
    }
}
