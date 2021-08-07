//
//  KeychainLocalStorageImpl.swift
//
//  Created by Giomar Rodriguez on 10/21/20.
//

import UIKit
import LocalAuthentication

final class KeychainLocalStorageImpl: LocalStorage {
    static let defaultBundleIdentifier = "com.adamteale.tvmaze"
    private let service: String
    private let context: LAContext
    private let bundle: Bundle
    private let device: UIDevice

    init(context: LAContext,
         bundle: Bundle,
         device: UIDevice) {
        self.context = context
        self.bundle = bundle
        self.device = device
        guard let identifier = bundle.bundleIdentifier else {
            service = KeychainLocalStorageImpl.defaultBundleIdentifier
            return
        }
        service = identifier

        removeDataIfAppWasReinstall()
    }

    func removeDataIfAppWasReinstall() {
        let uniqueDeviceId = device.identifierForVendor?.uuidString
        guard let uniqueDeviceIdSaved: String = load(
                key: KeychainKeys.uniqueDeviceID.rawValue
        ) else {
            _ = save(uniqueDeviceId, key: KeychainKeys.uniqueDeviceID.rawValue)
            return
        }

        if uniqueDeviceId != uniqueDeviceIdSaved {
            clear()
            _ = save(uniqueDeviceId, key: KeychainKeys.uniqueDeviceID.rawValue)
        }
    }

    func save<T>(_ value: T?, key: String, useAuthentication: Bool) -> Bool {
        do {
            let data: Data?
            switch value.self {
            case is String:
                let string = value as? String
                data = string?.data(using: .utf8, allowLossyConversion: false)
            case is Int:
                let number = NSNumber(value: value as! Int)
                data = try NSKeyedArchiver.archivedData(withRootObject: number, requiringSecureCoding: true)
            case is Double:
                let number = NSNumber(value: value as! Double)
                data = try NSKeyedArchiver.archivedData(withRootObject: number, requiringSecureCoding: true)
            case is Float:
                let number = NSNumber(value: value as! Float)
                data = try NSKeyedArchiver.archivedData(withRootObject: number, requiringSecureCoding: true)
            case is Bool:
                let number = NSNumber(value: value as! Bool)
                data = try NSKeyedArchiver.archivedData(withRootObject: number, requiringSecureCoding: true)
            default:
                data = nil
            }
            guard let newData = data else {
                return false
            }
            if useAuthentication {
                return saveValueWithAuthentication(service: service, account: key, data: newData)
            } else {
                return saveValue(service: service, account: key, data: newData)
            }
        } catch {
            return false
        }
    }

    func load<T>(key: String) -> T? {
        do {
            let value: T?
            guard let data = loadValue(service: service, key: key) else {
                return nil
            }

            switch T.self {
            case is String.Type:
                let string = String(data: data, encoding: .utf8)
                value = string as? T
            case is Int.Type:
                let number = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSNumber.self, from: data)
                value = number?.intValue as? T
            case is Double.Type:
                let number = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSNumber.self, from: data)
                value = number?.doubleValue as? T
            case is Float.Type:
                let number = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSNumber.self, from: data)
                value = number?.floatValue as? T
            case is Bool.Type:
                let number = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSNumber.self, from: data)
                value = number?.boolValue as? T
            default:
                value = data as? T
            }
            return value
        } catch {
            return Optional<T>.none
        }
    }

    func delete(key: String) -> Bool {
        return removeValue(service: service, key: key)
    }

    func contains(key: String) -> Bool {
        let query: [AnyHashable: Any] = [
            kSecClass as AnyHashable: kSecClassGenericPassword,
            kSecAttrService as AnyHashable: bundle.bundleIdentifier ?? service,
            kSecAttrAccount as AnyHashable: key,
            kSecUseAuthenticationUI as AnyHashable: kSecUseAuthenticationUIFail
        ]

        let status = SecItemCopyMatching(query as CFDictionary, nil)
        switch status {
        case errSecSuccess, errSecInteractionNotAllowed:
            return true
        default:
            return false
        }
    }

    private func saveValue(service: String, account: String, data: Data) -> Bool {
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]

        // Return Keychain item that matches the query
        var status = SecItemCopyMatching(keychainQuery as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            let attributes: NSMutableDictionary = [
                kSecValueData: data
            ]

            // Update the keychain item
            status = SecItemUpdate(keychainQuery as CFDictionary, attributes as CFDictionary)
            if status != errSecSuccess {
                return false
            }
            return true
        case errSecItemNotFound:
            keychainQuery[kSecValueData] = data

            // Add the new keychain item
            status = SecItemAdd(keychainQuery, nil)
            if status != errSecSuccess {
                fallthrough
            }
            return true
        default:
            return false
        }
    }

    private func saveValueWithAuthentication(service: String, account: String, data: Data) -> Bool {
        let access = SecAccessControlCreateWithFlags(nil,
                                                     kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
                                                     .biometryAny,
                                                     nil)
        context.localizedCancelTitle = L10n.cancel
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccessControl as String: access as Any,
            kSecUseAuthenticationContext as String: context,
            kSecAttrAccount: account
        ]

        // Return Keychain item that matches the query
        var status = SecItemCopyMatching(keychainQuery as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            let attributes: NSMutableDictionary = [
                kSecValueData: data
            ]

            // Update the keychain item
            status = SecItemUpdate(keychainQuery as CFDictionary, attributes as CFDictionary)
            if status != errSecSuccess {
                return false
            }
            return true
        case errSecItemNotFound:
            keychainQuery[kSecValueData] = data

            // Add the new keychain item
            status = SecItemAdd(keychainQuery, nil)
            if status != errSecSuccess {
                fallthrough
            }
            return true
        default:
            return false
        }
    }

    func removeValue(service: String, key: String) -> Bool {
        let keychainQuery: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue!
        ]

        let status = SecItemDelete(keychainQuery)
        return (status != errSecSuccess) ? false : true
    }

    func loadValue(service: String, key: String) -> Data? {
        let keychainQuery: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key,
            kSecReturnAttributes: kCFBooleanTrue!,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &result)
        guard status == errSecSuccess,
              let queriedItem = result as? NSMutableDictionary,
              let data = queriedItem[kSecValueData] as? Data else {
            return nil
        }

        return data
    }

    private func clear() {
        let keychainQuery: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service
        ]
        _ = SecItemDelete(keychainQuery)
    }
}
