//
//  NetworkDataDecoderImpl.swift
//
//  Created by Giomar Rodriguez on 14/06/21.
//

import Foundation

final class NetworkDataDecoderImpl: NetworkDataDecoder {

    private let jsonDecoder = JSONDecoder()

    func decodeJson<T: Decodable>(dataAsJson: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: dataAsJson)
    }
}
