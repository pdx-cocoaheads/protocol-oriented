//
//  StorageType.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/4/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

// DONT USE THIS IN PRODUCTION
typealias Storable = _ObjectiveCBridgeable

protocol StorageType {

    // Fetch an object from the Store
    func fetchObjectForKey<T: Storable>(key: String) -> T?

    // Remove an object from the store
    func removeObjectForKey(key: String)

    // Add an object to the store
    func storeObject<T: Storable>(object: T, forKey key: String)
}

// To mark secure stores
protocol SecureStorageType: StorageType { }
