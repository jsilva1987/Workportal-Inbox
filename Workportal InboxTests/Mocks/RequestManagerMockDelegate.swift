//
//  RequestManagerMockDelegate.swift
//  Workportal Inbox
//
//  Created by trink2 on 9/5/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import XCTest
@testable import Workportal_Inbox

class RequestManagerMockDelegate: RequestManagerDelegate {
    
    var asyncExpectation: XCTestExpectation?
    var expectedResponse: [PendingTask]?
    
    func pendingTasksRequestDidComplete(_ responseTasks: [PendingTask]) {
        guard let expectation = asyncExpectation else {
            return
        }
        
        expectedResponse = responseTasks
        expectation.fulfill()
    }
    
}
