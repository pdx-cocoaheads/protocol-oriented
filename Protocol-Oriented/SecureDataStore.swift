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
        guard let data = keychain.getData(key) else { return nil }
        guard let object: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) else { return nil }

        return object as? T
    }

    func removeObjectForKey(key: String) {
        keychain.remove(key)
    }

    func storeObject<T : Storable>(object: T, forKey key: String) {
        guard let object: AnyObject = object as? AnyObject else { return }
        let data = NSKeyedArchiver.archivedDataWithRootObject(object)

        keychain.set(data, key: key)
    }
}
