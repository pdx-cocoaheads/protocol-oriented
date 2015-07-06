//
//  UnsecureToSecureDataStore.swift
//  Protocol-Oriented
//
//  Created by Jeff Boek on 7/6/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

final class UnsecureToSecureDataStore: StorageType {

    private let secureStorage: SecureStorageType
    private let unsecureStorage: StorageType

    init(unsecureStorage: StorageType, secureStorage: SecureStorageType) {
        self.secureStorage = secureStorage
        self.unsecureStorage = unsecureStorage
    }

    func fetchObjectForKey<T : Storable>(key: String) -> T? {
        return secureStorage.fetchObjectForKey(key) ?? migrateKey(key)
    }

    func removeObjectForKey(key: String) {
        secureStorage.removeObjectForKey(key)
        unsecureStorage.removeObjectForKey(key)
    }

    func storeObject<T : Storable>(object: T, forKey key: String) {
        secureStorage.storeObject(object, forKey: key)
    }

    private func migrateKey<T: Storable>(key: String) -> T? {
        guard let object: T = unsecureStorage.fetchObjectForKey(key) else { return nil }
        secureStorage.storeObject(object, forKey: key)

        return object
    }
}
