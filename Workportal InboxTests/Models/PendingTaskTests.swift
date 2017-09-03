//
//  PendingTaskTests.swift
//  Workportal Inbox
//
//  Created by trink2 on 8/29/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import XCTest
@testable import Workportal_Inbox

class PendingTaskTests: XCTestCase {
    
    var dateFormatter: DateFormatter?

    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testPendingTaskModel() {
        let pendingTask = PendingTaskMocks.taskOne
        XCTAssertNotNil(pendingTask)
        XCTAssertEqual(pendingTask.processId, 1)
        XCTAssertEqual(pendingTask.process, "Vacations")
        XCTAssertEqual(pendingTask.activityId, 1)
        XCTAssertEqual(pendingTask.activity, "Approval")
        XCTAssertEqual(pendingTask.requestDate, dateFormatter?.isoFormatDate(from: "2013-03-01"))
        XCTAssertEqual(pendingTask.employee, "Andres Iniesta")
        XCTAssertEqual(pendingTask.beginDate, dateFormatter?.isoFormatDate(from: "2013-12-23"))
        XCTAssertEqual(pendingTask.endDate, dateFormatter?.isoFormatDate(from: "2014-01-03"))
        XCTAssertEqual(pendingTask.lastVacationOn, dateFormatter?.isoFormatDate(from: "2013-01-03"))
        XCTAssertEqual(pendingTask.approved, false)
        XCTAssertEqual(pendingTask.requestedDays, 12)
    }
    
    func testDateStringFormatting() {
        let pendingTask = PendingTaskMocks.taskOne
        
        let beginDate = pendingTask.beginDate
        XCTAssertEqual(dateFormatter?.isoFormatString(from: beginDate), "2013-12-23")
        
        let endDate = pendingTask.endDate
        XCTAssertEqual(dateFormatter?.isoFormatString(from: endDate), "2014-01-03")
    }
}
