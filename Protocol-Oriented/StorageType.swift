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

    func fetchObjectForKey<T: Storable>(key: String) -> T?
    func removeObjectForKey(key: String)
    func storeObject<T: Storable>(object: T, forKey key: String)
}

protocol SecureStorageType: StorageType { }