//
//  CFString+toString.swift
//  safesensor
//
//  Created by Anton Skorodumov on 21.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension CFString {
    
    func toString() -> String {
        let nsTypeString = self as NSString
        return nsTypeString as String
    }
    
}
