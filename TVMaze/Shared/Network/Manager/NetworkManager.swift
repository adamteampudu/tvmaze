//
//  NetworkManager.swift
//  TVMaze
//
//  Created by Daniel Santamaria on 10/20/20.
//

import Foundation

protocol NetworkManager {
    func request<P: Encodable, R: Decodable>(
        endpoint: String,
        method: HTTPNetworkMethod,
        parameters: P,
        onCompletion: @escaping (ApiResult<R>) -> Void
    )

    func requestNoParams<R: Decodable>(
        endpoint: String,
        method: HTTPNetworkMethod,
        onCompletion: @escaping (ApiResult<R>) -> Void
    )
}
