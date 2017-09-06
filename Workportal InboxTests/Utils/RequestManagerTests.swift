//
//  RequestManagerTests.swift
//  Workportal Inbox
//
//  Created by trink2 on 9/5/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import XCTest
@testable import Workportal_Inbox

class RequestManagerTests: XCTestCase {
    
    var requestManager: RequestManager?
    var requestManagerMockDelegate: RequestManagerMockDelegate?
    
    override func setUp() {
        super.setUp()
        requestManagerMockDelegate = RequestManagerMockDelegate()
        requestManager = RequestManager(delegate: requestManagerMockDelegate)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPendingTasksRequestWithSuccessfulDelegateCall(){
        let asyncExpectation = expectation(description: "delegate call expectation")
        self.requestManagerMockDelegate?.asyncExpectation = asyncExpectation
        
        requestManager?.requestPendingTasks()
        
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                XCTFail("waitForExpectations failed: \(error)")
                return
            }
            
            guard let result = self.requestManagerMockDelegate?.expectedResponse else {
                XCTFail("delegate method was not called")
                return
            }
            
            XCTAssertEqual(result.count, PendingTaskMocks.tasksArray.count)
        }
    }
    
}
