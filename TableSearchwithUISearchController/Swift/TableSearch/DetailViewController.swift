/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The detail view controller navigated to from our main and results table.
*/
import Foundation
import UIKit

class DetailViewController: UIViewController {
    // MARK: Types

    // Constants for Storyboard/ViewControllers.
    static let storyboardName = "MainStoryboard"
    static let viewControllerIdentifier = "DetailViewController"
    
    // Constants for state restoration.
    static let restoreJob = "restoreJobKey"

    // MARK: Properties
    
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet weak var jobText: UITextView!
    var job: Job! = nil
    
    // MARK: Initialization
    
    class func detailViewControllerForjob(job: Job) -> DetailViewController {
        let storyboard = UIStoryboard(name: DetailViewController.storyboardName, bundle: nil)

        let viewController = storyboard.instantiateViewControllerWithIdentifier(DetailViewController.viewControllerIdentifier) as! DetailViewController
        
        viewController.job = job
        
        return viewController
    }
    
    // MARK: View Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        title = job.title
        
        yearLabel.text = "\(job.datePosted)"
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        numberFormatter.formatterBehavior = .BehaviorDefault
        let jobString = numberFormatter.stringFromNumber(job.jobSalary)
 
        jobLabel.text! = jobString!
        
    }
    
    // MARK: UIStateRestoration

    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
        
        // Encode the job.
        coder.encodeObject(job, forKey: DetailViewController.restoreJob)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
        
        // Restore the job.
        if let decodedJob = coder.decodeObjectForKey(DetailViewController.restoreJob) as? Job {
            job = decodedJob
        }
        else {
            fatalError("A job did not exist. In your app, handle this gracefully.")
        }
    }

}
