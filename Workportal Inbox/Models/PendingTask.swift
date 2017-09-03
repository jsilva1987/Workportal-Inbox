//
//  PendingTask.swift
//  Workportal Inbox
//
//  Created by trink2 on 8/29/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import UIKit

class PendingTask: NSObject {
    
    // MARK: - JSON Keys
    
    enum PendingTaskKeys: String {
        case processId
        case process
        case activityId
        case activity
        case requestDate
        case employee
        case beginDate
        case endDate
        case lastVacationOn
        case approved
    }

    // MARK: - Properties
    
    var processId: Int = 0
    var process: String = ""
    var activityId: Int = 0
    var activity: String = ""
    var requestDate: Date = Date()
    var employee: String = ""
    var beginDate: Date = Date()
    var endDate: Date = Date()
    var lastVacationOn: Date = Date()
    var approved: Bool = false
    
    // MARK: - Requested Days
    
    let dayAsSeconds = 86400
    
    var requestedDays: Int {
        get {
            //Adjustmend needed due to DateInterval not including the starting day as part of the vacation period
            let requestedSeconds = Int(DateInterval(start: beginDate, end: endDate).duration)
            return (requestedSeconds / dayAsSeconds) + 1
        }
    }
    
    // MARK: - Initializer
    
    init(response: [String: Any]) {
        
        //Integer values
        processId = response[PendingTaskKeys.processId.rawValue] as? Int ?? 0
        activityId = response[PendingTaskKeys.activityId.rawValue] as? Int ?? 0

        //String values
        process = response[PendingTaskKeys.process.rawValue] as? String ?? ""
        activity = response[PendingTaskKeys.activity.rawValue] as? String ?? ""
        employee = response[PendingTaskKeys.employee.rawValue] as? String ?? ""
        
        //Date values
        
        let dateFormatter = DateFormatter()
        
        if let requestDateValue = response[PendingTaskKeys.requestDate.rawValue] as? String {
            requestDate = dateFormatter.isoFormatDate(from: requestDateValue) ?? Date()
        }
        
        if let beginDateValue = response[PendingTaskKeys.beginDate.rawValue] as? String {
            beginDate = dateFormatter.isoFormatDate(from: beginDateValue) ?? Date()
        }
        
        if let endDateValue = response[PendingTaskKeys.endDate.rawValue] as? String {
            endDate = dateFormatter.isoFormatDate(from: endDateValue) ?? Date()
        }
        
        if let lastVacationOnValue = response[PendingTaskKeys.lastVacationOn.rawValue] as? String {
            lastVacationOn = dateFormatter.isoFormatDate(from: lastVacationOnValue) ?? Date()
        }
        
        //Bool values
        approved = response[PendingTaskKeys.approved.rawValue] as? Bool ?? false
    }
}
