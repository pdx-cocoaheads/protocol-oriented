//
//  ViewController.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/3/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    /// The backing data store
    let dataStore: StorageType = NSUserDefaults.standardUserDefaults()
    
    /// The String array of names that will be the datasource for our tableView
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Grab all of the names from our DataStore
        names = dataStore.fetchNames()
    }
    
    @IBAction func addAction() {
        // Only store non-empty names
        guard let name = textField.text where !name.isEmpty else { return }
        
        // Clear the text field
        textField.text = nil
        
        // Store the name into the dataStore
        dataStore.addName(name)
        reloadData()
    }
    
    /// Fetch names from the dataStore and reload the tableView data
    func reloadData() {
        names = dataStore.fetchNames()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let name = names[indexPath.row]
        cell.textLabel?.text = name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.beginUpdates()
        if editingStyle == .Delete {
            // Grab the name from our names property
            let name = names.removeAtIndex(indexPath.row)
            
            // Remove that name from the dataStore
            dataStore.removeName(name)
            
            // Remove the row from the tableView
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        tableView.endUpdates()
    }
}

