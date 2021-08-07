//
//  KeyChainProtocol.swift
//
//  Created by Giomar Rodriguez on 10/21/20.
//

import Foundation

protocol LocalStorage {
    func save<T>(_ value: T?, key: String, useAuthentication: Bool) -> Bool
    func load<T>(key: String) -> T?
    func delete(key: String) -> Bool
    func contains(key: String) -> Bool
}

extension LocalStorage {
    func save<T>(_ value: T?, key: String, useAuthentication: Bool = false) -> Bool {
        return save(value, key: key, useAuthentication: useAuthentication)
    }
}
