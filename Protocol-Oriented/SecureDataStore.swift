//
//  SecureDataStore.swift
//  Protocol-Oriented
//
//  Created by Jeff Boek on 7/4/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

final class SecureDataStore: SecureStorageType {

    private var keychain = Keychain(service: "org.pdx-ios")

    func fetchObjectForKey<T : Storable>(key: String) -> T? {
        return keychain[key] as? T
    }

    func removeObjectForKey(key: String) {
        keychain[key] = nil
    }

    func storeObject<T : Storable>(object: T, forKey key: String) {
        keychain[key] = "yest"
    }
}
