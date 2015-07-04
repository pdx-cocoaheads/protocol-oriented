//
//  StorageType.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/4/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

protocol StorageType {
    func addName(name: String)
    func removeName(name: String)
    func fetchNames() -> [String]
}