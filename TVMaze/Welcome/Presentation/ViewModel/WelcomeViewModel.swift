//
//  WelcomeViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

final class WelcomeViewModel: BaseViewModel {

    var onContinueObservable: Observable<Void> {
        onContinueSubject
    }

    private let onContinueSubject = PublishSubject<Void>()

    func onContinue() {
        onContinueSubject.onNext(())
    }
}
