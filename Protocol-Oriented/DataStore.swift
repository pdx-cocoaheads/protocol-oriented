//
//  DataStore.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/3/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import Foundation

private let namesKey = "org.pdx-ios.names"

extension NSUserDefaults : StorageType {
    
    func addName(name: String) {
        var names = fetchNames()
        names.append(name)
        setObject(names, forKey: namesKey)
    }
    
    func removeName(name: String) {
        var names = fetchNames()
        guard let i = names.indexOf(name) else { return }
        
        names.removeAtIndex(i)
        setObject(names, forKey: namesKey)
    }
    
    func fetchNames() -> [String] {
        return objectForKey(namesKey) as? [String] ?? []
    }
}