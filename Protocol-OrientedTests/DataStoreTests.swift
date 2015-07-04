//
//  DataStoreTests.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/4/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import XCTest

@testable
import Protocol_Oriented

class DataStoreTests: XCTestCase {

    let defaults = MockDefaults()
    var store: StorageType!
    
    override func setUp() {
        super.setUp()
        defaults.names = []
        store = defaults
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        store = nil
        super.tearDown()
    }

    func testAddName_addsName() {
        let testName = "test"
        
        store.addName(testName)
        XCTAssertEqual(defaults.names, [testName], "Adding a name to the DataStore should add it to its defaults property")
    }
    
    func testRemoveName_removesName() {
        let testName = "test"
        defaults.names = [testName]
        
        store.removeName(testName)
        XCTAssertEqual(defaults.names, [], "Removing a name from the DataStore should remove it from its defaults property")
    }
    
    func testRemoveName_removesOnlyTheName() {
        let name1 = "1"
        let name2 = "2"
        let name3 = "test"
        let name4 = "tset"
        defaults.names = [name1, name2, name3, name4]
        
        store.removeName(name3)
        XCTAssertEqual(defaults.names, [name1, name2, name4], "Removing a name from the DataStore should remove that name and only that name from its defaults property.")
    }
    
    func testFetchNames_returnsAllNames() {
        let name1 = "1"
        let name2 = "2"
        let name3 = "test"
        let name4 = "tset"
        defaults.names = [name1, name2, name3, name4]
        
        let fetchedNames = store.fetchNames()
        XCTAssertEqual(fetchedNames, defaults.names, "fetchNames should return all of the names stored in its defaults property")
    }

}

class MockDefaults: NSUserDefaults {
    var names: [String] = []
    
    override func setObject(value: AnyObject?, forKey defaultName: String) {
        if let names = value as? [String] {
            self.names = names
        }
    }
    
    override func objectForKey(defaultName: String) -> AnyObject? {
        return names
    }
}
