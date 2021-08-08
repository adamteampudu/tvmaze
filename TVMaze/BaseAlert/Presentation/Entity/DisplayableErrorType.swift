//
//  DisplayableErrorType.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

enum DisplayableErrorType: Equatable {
    case serverError(code: Int? = nil, message: String? = nil)
    case connectionError
}

extension DisplayableErrorType: BaseAlertViewContentArgs {
    var title: String? {
        switch self {
        case .connectionError:
            return L10n.ok
        case.serverError:
            return L10n.ok
        }
    }

    var body: String? {
        switch self {
        case .connectionError:
            return L10n.ok
        case.serverError:
            return L10n.ok
        }
    }

    var mainActionTitle: String? {
        switch self {
        case .connectionError:
            return L10n.ok
        case.serverError:
            return L10n.ok
        }

    }

    var secondaryActionTitle: String? {
        switch self {
        case .connectionError:
            return L10n.ok
        case.serverError:
            return L10n.ok
        }
    }

}
