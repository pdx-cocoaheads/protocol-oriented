//
//  StorageType.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/4/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

/// A type that can store values somewhere
protocol StorageType {
    /// Adds a name to the data store.
    func addName(name: String)
    
    /// Removes the first occurence of the given `name` from the data store.
    func removeName(name: String)
    
    /// Returns all of the names stored in the data store.
    func fetchNames() -> [String]
}