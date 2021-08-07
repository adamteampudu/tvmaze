//
//  NetworkModule.swift
//  TVMaze
//
//  Created by Daniel Santamaria on 10/20/20.
//

import Foundation
import Swinject
import Alamofire

class NetworkModule {

    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject() {

        container.register(Session.self) { _ in
            AF
        }

        container.register(NetworkDataDecoder.self) { _ in
            NetworkDataDecoderImpl()
        }

        container.register(NetworkSession.self) { resolver in
            NetworkSessionImpl(
                alamofire: resolver.resolve(Session.self)!,
                decoder: resolver.resolve(NetworkDataDecoder.self)!
            )
        }

        container.register(NetworkManager.self) { resolver in
            NetworkManagerImpl(
                networkSession: resolver.resolve(NetworkSession.self)!
            )
        }
    }
}
