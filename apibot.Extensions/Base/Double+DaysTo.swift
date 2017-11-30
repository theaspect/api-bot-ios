//
//  Double+ToHours.swift
//  vc
//
//  Created by Anton Skorodumov on 02.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension Double {
    
    mutating func daysToHours() {
        self = self * 24
    }

    mutating func daysToSeconds() {
        self = self * 86400
    }
    
    
}
