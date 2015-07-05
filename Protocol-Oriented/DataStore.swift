//
//  DataStore.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/3/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

/// A class for storing data into NSUserDefaults
class DataStore {
    /// The NSUserDefaults instance to save our data into.
    private let defaults: NSUserDefaults
    
    /// The key to store our data under in the NSUserDefaults
    private let namesKey = "org.pdx-ios.names"
    
    /// Create a DataStore that stores to the given NSUserDefaults.
    init(defaults: NSUserDefaults) {
        self.defaults = defaults
    }
    
    /// Adds a name to the data store.
    func addName(name: String) {
        var names = fetchNames()
        names.append(name)
        defaults.setObject(names, forKey: namesKey)
    }
    
    /// Removes the first occurence of the given `name` from the data store.
    func removeName(name: String) {
        var names = fetchNames()
        guard let i = names.indexOf(name) else { return }
        
        names.removeAtIndex(i)
        defaults.setObject(names, forKey: namesKey)
    }
    
    /// Returns all of the names stored in the data store.
    func fetchNames() -> [String] {
        return defaults.objectForKey(namesKey) as? [String] ?? []
    }
}