//
//  ErrorArgs.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

struct ErrorArgs {
    let error: ErrorType
    let presentationType: ViewPresentationType
    let onMainAction: (() -> Void)?
    let onSecondaryAction: (() -> Void)?
}
