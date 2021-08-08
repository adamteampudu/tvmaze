//
//  Loader.swift
//
//  Created by Nicolás García on 26/11/2020.
//

import UIKit

final class Loader {
    private var loaderView: LoaderView?

    func show() {
        loaderView = LoaderView()
        loaderView?.show()
    }

    func hide(onCompletion: @escaping() -> Void) {
        loaderView?.hide(onCompletion: onCompletion)
    }
}
