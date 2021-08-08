//
//  UserDefaultsLocalStorageImpl.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Foundation

final class UserDefaultsLocalStorageImpl: UserDefaultsLocalStorage {

    let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func save<T>(_ value: T?, key: String, useAuthentication: Bool) -> Bool {
        userDefaults.set(value, forKey: key)
        return true
    }

    func load<T>(key: String) -> T? {
        if let value = userDefaults.object(forKey: key) as? T {
            return value
        }
        return nil
    }

    func delete(key: String) -> Bool {
        userDefaults.set(nil, forKey: key)
        return true
    }

    func contains(key: String) -> Bool {
        return userDefaults.value(forKey: key) != nil
    }

}
