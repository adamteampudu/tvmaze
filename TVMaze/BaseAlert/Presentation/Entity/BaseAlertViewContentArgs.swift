//
//  BaseAlertViewContentArgs.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

protocol BaseAlertViewContentArgs {
    var image: UIImage? { get }
    var title: String? { get }
    var body: String? { get }
    var mainActionTitle: String? { get }
    var secondaryActionTitle: String? { get }
}

