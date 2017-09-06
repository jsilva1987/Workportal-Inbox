//
//  PendingTaskMocks.swift
//  Workportal Inbox
//
//  Created by trink2 on 8/29/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import Foundation

class PendingTaskMocks : NSObject {
    
    static var tasksArray: [PendingTask] {
        return [PendingTaskMocks.taskOne,
                PendingTaskMocks.taskTwo,
                PendingTaskMocks.taskThree,
                PendingTaskMocks.taskFour,
                PendingTaskMocks.taskFive]
    }
    
    static var taskOne: PendingTask {
        get {
            let mockResponse: [String: Any] = ["processId": 1,
                                               "process": "Vacations",
                                               "activityId": 1,
                                               "activity": "Approval",
                                               "requestDate": "2013-03-01",
                                               "employee": "Andres Iniesta",
                                               "beginDate": "2013-12-23",
                                               "endDate": "2014-01-03",
                                               "lastVacationOn": "2013-01-03",
                                               "approved": ""]
            
            return PendingTask(response: mockResponse)
        }
    }
    
    static var taskTwo: PendingTask {
        get {
            let mockResponse: [String: Any] = ["processId": 1,
                                               "process": "Vacations",
                                               "activityId": 2,
                                               "activity": "Approval",
                                               "requestDate": "2013-01-17",
                                               "employee": "Xavi Hernandez",
                                               "beginDate": "2013-12-23",
                                               "endDate": "2013-12-24",
                                               "lastVacationOn": "2012-06-01",
                                               "approved": ""]
            
            return PendingTask(response: mockResponse)
        }
    }
    
    static var taskThree: PendingTask {
        get {
            let mockResponse: [String: Any] = ["processId": 1,
                                               "process": "Vacations",
                                               "activityId": 3,
                                               "activity": "Approval",
                                               "requestDate": "2013-03-02",
                                               "employee": "Sergio Busquets",
                                               "beginDate": "2013-12-23",
                                               "endDate": "2013-12-26",
                                               "lastVacationOn": "2012-07-01",
                                               "approved": ""]
            
            return PendingTask(response: mockResponse)
        }
    }
    
    static var taskFour: PendingTask {
        get {
            let mockResponse: [String: Any] = ["processId": 1,
                                               "process": "Vacations",
                                               "activityId": 4,
                                               "activity": "Approval",
                                               "requestDate": "2013-02-25",
                                               "employee": "Carles Puyol",
                                               "beginDate": "2013-12-23",
                                               "endDate": "2013-12-27",
                                               "lastVacationOn": "2012-08-01",
                                               "approved": ""]
            
            return PendingTask(response: mockResponse)
        }
    }
    
    static var taskFive: PendingTask {
        get {
            let mockResponse: [String: Any] = ["processId": 1,
                                               "process": "Vacations",
                                               "activityId": 5,
                                               "activity": "Approval",
                                               "requestDate": "2013-02-28",
                                               "employee": "Francesc Fabregas",
                                               "beginDate": "2013-12-23",
                                               "endDate": "2014-01-02",
                                               "lastVacationOn": "2012-09-01",
                                               "approved": ""]
            
            return PendingTask(response: mockResponse)
        }
    }
    
}
