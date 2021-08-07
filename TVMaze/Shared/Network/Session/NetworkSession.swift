//
//  NetworkSession.swift
//
//  Created by Giomar Rodriguez on 14/06/21.
//

import Foundation

protocol NetworkSession {

    func request<P: Encodable, R: Decodable>(
        url: String,
        method: HTTPNetworkMethod,
        parameters: P,
        encoder: ParameterNetworkEncoder,
        onCompletion: @escaping (ApiResult<R>) -> Void,
        onSessionExpired: (() -> Void)?
    )

    func requestNoParams<R: Decodable>(
        url: String,
        method: HTTPNetworkMethod,
        onCompletion: @escaping (ApiResult<R>) -> Void,
        onSessionExpired: (() -> Void)?
    )
}
