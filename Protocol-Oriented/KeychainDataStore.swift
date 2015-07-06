//
//  SecureDataStore.swift
//  Protocol-Oriented
//
//  Created by Jeff Boek on 7/4/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

/// Keychain Store
final class KeychainDataStore: SecureStorageType {

    private var keychain = Keychain(service: "org.pdx-ios")

    /// Fetch an object from the keychain
    func fetchObjectForKey<T : Storable>(key: String) -> T? {
        guard let data = keychain.getData(key) else { return nil }
        guard let object: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) else { return nil }

        return object as? T
    }

    /// Remove an object from the keychain
    func removeObjectForKey(key: String) {
        keychain.remove(key)
    }

    /// Store an object in the keychain
    func storeObject<T : Storable>(object: T, forKey key: String) {
        guard let object: AnyObject = object as? AnyObject else { return }
        let data = NSKeyedArchiver.archivedDataWithRootObject(object)

        keychain.set(data, key: key)
    }
}
