//
//  Date+DateFormat.swift
//  vc
//
//  Created by Anton Skorodumov on 02.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum DateFormat: String {
    
    case fullFormat = "yyyy-MM-dd HH:mm:ss"
    case onlyDate = "yyyy-MM-dd"
    case onlyTime = "HH:mm:ss"
    case hoursMinutes = "HH:mm"
    case fullHours = "yyyy-MM-dd HH"
    
}

extension Date {
    
    func toString(with format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = TimeZone.autoupdatingCurrent
        return formatter.string(from: self)
    }
    
    func toDate(with format: DateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = TimeZone.autoupdatingCurrent
        let stringDate = self.toString(with: format)
        return formatter.date(from: stringDate)
    }
    
}
