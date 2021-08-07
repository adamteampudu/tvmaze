//
//  BaseViewModel.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation
import RxSwift

class BaseViewModel {
    final let isLoadingSubject = PublishSubject<Bool>()

    final var isLoadingObservable: Observable<Bool> {
        isLoadingSubject.asObservable()
    }

    var baseErrorObservable: Observable<ErrorArgs> {
        errorSubject.asObservable()
    }

    private let errorSubject = PublishSubject<ErrorArgs>()

    /// Here we would add methods to handle unauthorised access and expired sessions

    func onError(
        _ errorType: ErrorType,
        with presentationType: ViewPresentationType = .presentPopUp,
        onMainAction: (() -> Void)? = nil,
        onSecondaryAction: (() -> Void)? = nil
    ) {
//        let error: DisplayableErrorType
//        switch errorType {
//        case .connection:
//            error = .connectionError
//        case .api(let apiError, let debugModeStatus):
//            if debugModeStatus == .on {
//                error = .serverErrorDebugMode(code: apiError.code, message: apiError.message)
//            } else {
//                error = .serverError(code: apiError.code, message: apiError.message)
//            }
//        case .general:
//            error = .serverError()
//        }
//        errorSubject.onNext(ErrorArgs(
//            error: error,
//            presentationType: presentationType,
//            onMainAction: onMainAction,
//            onSecondaryAction: onSecondaryAction
//        ))
    }
}
