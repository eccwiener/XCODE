/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The application delegate class used for setting up our data model and state restoration.
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Properties

    var window: UIWindow?
    
    // MARK: - Application Life Cycle

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let jobs = [
            Job(jobType: Job.jobTypeTitle, title: Job.Jobs.job1.rawValue, datePosted: 02/14/2016, jobSalary: 599.00),
            Job(jobType: Job.jobTypeTitle, title: Job.Jobs.job2.rawValue, datePosted: 03/20/2016, jobSalary: 399.00),
            Job(jobType: Job.jobTypeTitle, title: Job.Jobs.job3.rawValue, datePosted: 02/10/2015, jobSalary: 210.00),
            Job(jobType: Job.jobTypeTitle, title: Job.Jobs.job4.rawValue, datePosted: 01/20/2015, jobSalary: 499.00),
            Job(jobType: Job.jobTypeTitle, title: Job.Jobs.job5.rawValue, datePosted: 04/20/2012, jobSalary: 659.00),
            Job(jobType: Job.desktopTypeTitle, title: Job.Jobs.job6.rawValue, datePosted: 01/23/1997, jobSalary: 1299.00),
            Job(jobType: Job.desktopTypeTitle, title: Job.Jobs.job7.rawValue, datePosted: 07/08/2006, jobSalary: 2499.00),
            Job(jobType: Job.portableTypeTitle, title: Job.Jobs.job8.rawValue, datePosted: 08/02/2008, jobSalary: 1799.00),
            Job(jobType: Job.portableTypeTitle, title: Job.Jobs.job9.rawValue, datePosted: 01/01/2006, jobSalary: 1499.00),
            Job(jobType: Job.portableTypeTitle, title: Job.Jobs.job10.rawValue, datePosted: 05/24/2006, jobSalary: 1499.00)
        ]

        let navController = window!.rootViewController as! UINavigationController
        
        /*
            Note we want the first view controller (not the visibleViewController) in case
            we are being store from UIStateRestoration.
        */
        let tableViewController = navController.viewControllers.first as! MainTableViewController
        tableViewController.jobs = jobs

        return true
    }

    // MARK: - UIStateRestoration

    func application(application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
}
