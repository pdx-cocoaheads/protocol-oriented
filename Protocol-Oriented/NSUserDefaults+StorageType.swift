//
//  DataStore.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/3/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

extension NSUserDefaults: StorageType {
    // Fetch an object from the Store
    func fetchObjectForKey<T : Storable>(key: String) -> T? {
        return objectForKey(key) as? T
    }

    // NSUserDefaults already implements removeObjectForKey:

    // Store object
    func storeObject<T : Storable>(object: T, forKey key: String) {
        setObject((object as? AnyObject), forKey: key)
    }
}