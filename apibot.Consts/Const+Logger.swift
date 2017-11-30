//
//  Const+Logger.swift
//  vc
//
//  Created by Anton Skorodumov on 28.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension Const {
    
    struct Logger {
        
        static let rollingFrequency: TimeInterval = TimeInterval(0)
        static let maximumLogFilesCount: UInt = 3
        static let maximumFileSize: UInt64 = 2 * 1024 * 1024
    }
    
}
