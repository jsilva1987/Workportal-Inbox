//
//  RequestManager.swift
//  Workportal Inbox
//
//  Created by trink2 on 9/5/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import Foundation

protocol RequestManagerDelegate {
    func pendingTasksRequestDidComplete(_ responseTasks: [PendingTask])
}

class RequestManager: NSObject {
    
    let requestEndpoint = "https://private-33079-workportalinbox.apiary-mock.com/employees"
    var delegate: RequestManagerDelegate?
    
    init(delegate: RequestManagerDelegate? = nil) {
        super.init()
        self.delegate = delegate
    }
    
    //MARK: - Tasks Request
    
    /*
     Executes the request to retrieve the Pending Tasks and notifies the delegate once it's completed.
     The method also uses the mocks' array whenever there's an error in the retrieving process.
     */
    func requestPendingTasks() {
        
        let task = URLSession.shared.dataTask(with: employeesRequest()) { data, response, error in
            guard error == nil else {
                self.delegate?.pendingTasksRequestDidComplete(PendingTaskMocks.tasksArray)
                return
            }
            
            guard let data = data else {
                self.delegate?.pendingTasksRequestDidComplete(PendingTaskMocks.tasksArray)
                return
            }
            
            self.delegate?.pendingTasksRequestDidComplete(self.parseRequest(data))
        }
        
        task.resume()
    }
    
    fileprivate func employeesRequest() -> URLRequest {
        let url = URL(string: requestEndpoint)!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        return request
    }
    
    //MARK: - Parsing
    
    fileprivate func parseRequest(_ data: Data) -> [PendingTask] {
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            guard let arrayResponse = jsonResponse as? [Any] else {
                return PendingTaskMocks.tasksArray
            }
            
            return self.parsePendingTasks(from: arrayResponse)
        } catch {
            return PendingTaskMocks.tasksArray
        }
    }
    
    fileprivate func parsePendingTasks(from arrayResponse: [Any]) -> [PendingTask] {
        
        var pendingTasksArray: [PendingTask] = []
        
        for employeeResponse in arrayResponse {
            guard let employee = employeeResponse as? [String : Any] else {
                continue
            }
            
            let pendingTask = PendingTask(response: employee)
            pendingTasksArray.append(pendingTask)
        }
        
        return pendingTasksArray
    }
}
