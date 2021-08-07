//
//  NetworkDataDecoder.swift
//
//  Created by Daniel Santamaria on 10/20/20.
//

import Foundation

protocol NetworkDataDecoder {

    func decodeJson<T: Decodable>(dataAsJson: Data) throws -> T
}
