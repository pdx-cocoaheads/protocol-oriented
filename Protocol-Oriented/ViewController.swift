//
//  ViewController.swift
//  Protocol-Oriented
//
//  Created by Ryan Arana on 7/3/15.
//  Copyright © 2015 pdx-ios.org. All rights reserved.
//

import UIKit

private let kNamesKey = "org.pdx-ios.names"

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    private let dataStore: StorageType = NSUserDefaults.standardUserDefaults()
    private var names: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        names = dataStore.fetchObjectForKey(kNamesKey) ?? []
    }
    
    @IBAction func addAction() {
        guard let name = textField.text where !name.isEmpty else { return }
        textField.text = nil
        
        names.append(name)
		dataStore.storeObject(names, forKey: kNamesKey)
        reloadData()
    }
    
    func reloadData() {
        names = dataStore.fetchObjectForKey(kNamesKey) ?? []
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
            names.removeAtIndex(indexPath.row)
			dataStore.storeObject(names, forKey: kNamesKey)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        tableView.endUpdates()
    }
}

