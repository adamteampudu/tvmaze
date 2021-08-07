//
//  UITableViewCell+Extension.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cell: T.Type) where T: Reusable {
        register(
            UINib(
                nibName: T.identifier,
                bundle: nil
            ),
            forCellReuseIdentifier: T.identifier
        )
    }

}

