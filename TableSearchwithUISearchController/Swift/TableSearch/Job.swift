/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The data model object describing the job displayed in both main and results tables.
*/
import UIKit
import Foundation

class Job: NSObject, NSCoding {
    // MARK: Types
    
    enum CoderKeys: String {
        case jobKey
        case typeKey
        case locationKey
        case companyKey
    }
    
    enum Jobs: String {
        case job1 = "Job 1"
        case job2 = "Job 2"
        case job3 = "Job 3"
        case job4 = "Job 4"
        case job5 = "Job 5"
        case job6 = "Job 6"
        case job7 = "Job 7"
        case job8 = "Job 8"
        case job9 = "Job 9"
        case job10 = "Job 10"
    }
    
    // MARK: Properties
    
    let title: String
    let jobType: String
    let datePosted: Int
    let jobSalary: Double
    
    // MARK: Initializers
    
    init(jobType: String, title: String, datePosted: Int, jobSalary: Double) {
        self.jobType = jobType
        self.title = title
        self.datePosted = datePosted
        self.jobSalary = jobSalary
    }
    
    // MARK: NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey(CoderKeys.jobKey.rawValue) as! String
        jobType = aDecoder.decodeObjectForKey(CoderKeys.typeKey.rawValue) as! String
        datePosted = aDecoder.decodeIntegerForKey(CoderKeys.locationKey.rawValue)
        jobSalary = aDecoder.decodeDoubleForKey(CoderKeys.companyKey.rawValue)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: CoderKeys.jobKey.rawValue)
        aCoder.encodeObject(jobType, forKey: CoderKeys.typeKey.rawValue)
        aCoder.encodeInteger(datePosted, forKey: CoderKeys.locationKey.rawValue)
        aCoder.encodeDouble(jobSalary, forKey: CoderKeys.companyKey.rawValue)
    }
    
    // MARK: Device Type Info

    class var deviceTypeNames: [String] {
        return [
            Job.jobTypeTitle,
            Job.desktopTypeTitle,
            Job.portableTypeTitle
        ]
    }
    
    class var jobTypeTitle: String {
        return NSLocalizedString("Device", comment:"Device type title")
    }

    class var desktopTypeTitle: String {
        return NSLocalizedString("Desktop", comment:"Desktop type title")
    }

    class var portableTypeTitle: String {
        return NSLocalizedString("Portable", comment:"Portable type title")
    }
   
}
