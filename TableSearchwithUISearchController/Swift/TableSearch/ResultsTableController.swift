/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The table view controller responsible for displaying the filtered jobs as the user types in the search field.
*/

import UIKit

class ResultsTableController: BaseTableViewController {
    // MARK: Properties
    
    var filteredjobs = [Job]()
    
    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredjobs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BaseTableViewController.tableViewCellIdentifier)!
        
        let job = filteredjobs[indexPath.row]
        configureCell(cell, forjob: job)
        
        return cell
    }

    
}
