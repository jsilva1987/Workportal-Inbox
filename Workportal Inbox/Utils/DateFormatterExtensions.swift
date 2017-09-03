//
//  DateFormatterExtensions.swift
//  Workportal Inbox
//
//  Created by trink2 on 9/2/17.
//  Copyright © 2017 Bizagi. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func isoFormatDate(from string: String) -> Date? {
        self.dateFormat = "yyyy-MM-dd"
        return date(from: string)
    }
    
    func isoFormatString(from date: Date) -> String {
        self.dateFormat = "yyyy-MM-dd"
        return string(from: date)
    }
    
}
