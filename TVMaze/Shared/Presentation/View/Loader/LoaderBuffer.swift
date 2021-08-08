//
//  LoaderBuffer.swift
//
//  Created by Nicolás García on 26/11/2020.
//

import Foundation

final class LoaderBuffer {
    static let shared = LoaderBuffer()

    // Loaders that can be created from emitter.
    private var loaders: [Loader?] = []

    // Main loader buffer that holds current buffer in action
    // between the functions showLoader and hideLoader.
    private var loaderBuffer: Loader?

    // Creates the Loader and assigns it to the buffer to avoid losing references in the array
    // when hiding the loader.
    func showLoader() {
        loaderBuffer = Loader()
        loaderBuffer?.show()
        loaders.insert(loaderBuffer, at: 0)
    }

    // Hides the Loader assigned to the buffer and removes the last loader
    // added to the array.
    func hideLoader() {
        loaderBuffer?.hide(onCompletion: { [weak self] in
            self?.loaders.removeLast()
        })
        loaderBuffer = nil
    }
}
