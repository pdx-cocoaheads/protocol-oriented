//
//  DataStore.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/3/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

class DataStore: StorageType {
    private let defaults: NSUserDefaults
    private let namesKey = "org.pdx-ios.names"
    
    init(defaults: NSUserDefaults) {
        self.defaults = defaults
    }
    
    func addName(name: String) {
        var names = fetchNames()
        names.append(name)
        defaults.setObject(names, forKey: namesKey)
    }
    
    func removeName(name: String) {
        var names = fetchNames()
        guard let i = names.indexOf(name) else { return }
        
        names.removeAtIndex(i)
        defaults.setObject(names, forKey: namesKey)
    }
    
    func fetchNames() -> [String] {
        return defaults.objectForKey(namesKey) as? [String] ?? []
    }
}