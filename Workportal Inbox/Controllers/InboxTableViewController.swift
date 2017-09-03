//
//  InboxTableViewController.swift
//  Workportal Inbox
//
//  Created by trink2 on 8/30/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import UIKit

class InboxTableViewController: UITableViewController {
    
    var selectedRow: Int = -1
    var normalCellHeight: CGFloat = 100.0
    let extendedCellHeight: CGFloat = 125.0
    
    @IBOutlet weak var inboxTableView: UITableView!
    
    var pendingTasks: [PendingTask] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PendingTaskCell.nib(), forCellReuseIdentifier: PendingTaskCell.identifier())

        pendingTasks = [PendingTaskMocks.taskOne,
                        PendingTaskMocks.taskTwo,
                        PendingTaskMocks.taskThree,
                        PendingTaskMocks.taskFour,
                        PendingTaskMocks.taskFive]
        
        inboxTableView.reloadData()
    }
    
}

// MARK: - Table view data source

extension InboxTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pendingTasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRow {
            return extendedCellHeight
        }
        
        return normalCellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pendingTaskCell = tableView.dequeueReusableCell(withIdentifier: PendingTaskCell.identifier(), for: indexPath) as! PendingTaskCell
        pendingTaskCell.configureCell(with: pendingTasks[indexPath.row])
        return pendingTaskCell
    }
}

// MARK: - Table view delegate

extension InboxTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRow == indexPath.row {
            selectedRow = -1
        } else {
            selectedRow = indexPath.row
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
