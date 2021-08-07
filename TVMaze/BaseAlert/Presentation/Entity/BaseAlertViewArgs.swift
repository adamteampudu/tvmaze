//
//  BaseAlertViewArgs.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import Foundation

struct BaseAlertViewArgs {
    let contentArgs: BaseAlertViewContentArgs
    let presentation: ViewPresentationType
    let onMainAction: (() -> Void)?
    let onSecondaryAction: (() -> Void)?
    let onTertiaryAction: (() -> Void)?
}
