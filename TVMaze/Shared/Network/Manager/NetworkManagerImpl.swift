//
//  NetworkManagerImpl.swift
//  TVMaze
//
//  Created by Daniel Santamaria on 10/20/20.
//

import Foundation

class NetworkManagerImpl: NetworkManager {

    private enum Constants {
        static let baseUrl: String = ServerConstants.baseUrl
    }

    private let networkSession: NetworkSession

    init(
        networkSession: NetworkSession
    ) {
        self.networkSession = networkSession
    }

    func request<P, R>(
        endpoint: String,
        method: HTTPNetworkMethod,
        parameters: P,
        onCompletion: @escaping (ApiResult<R>) -> Void) where P: Encodable, R: Decodable {

        self.networkSession.request(
            url: Constants.baseUrl + endpoint,
            method: method,
            parameters: parameters,
            encoder: self.getParameterEncoder(method),
            onCompletion: onCompletion,
            onSessionExpired: { [weak self] in
                self?.request(
                    endpoint: endpoint,
                    method: method,
                    parameters: parameters,
                    onCompletion: onCompletion
                )
            }
        )

    }

    func requestNoParams<R>(
        endpoint: String,
        method: HTTPNetworkMethod,
        onCompletion: @escaping (ApiResult<R>) -> Void) where R: Decodable {

        self.networkSession.requestNoParams(
            url: ServerConstants.baseUrl + endpoint,
            method: method,
            onCompletion: onCompletion,
            onSessionExpired: { [weak self] in
                self?.requestNoParams(
                    endpoint: endpoint,
                    method: method,
                    onCompletion: onCompletion
                )
            }
        )
    }

    private func getParameterEncoder(_ method: HTTPNetworkMethod) -> ParameterNetworkEncoder {
        if method == .get {
            return .urlParameter
        } else {
            return .json
        }
    }

}
