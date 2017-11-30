//
//  ApplicationError.swift
//  safesensor
//
//  Created by Anton Skorodumov on 21.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol ApplicationError: Error {
    
    var title: String { get }
    var message: String { get }
    var log: String { get }
    var code: Int  { get }
    var extra: Extra? { get }
    
}

extension ApplicationError {
    
    var title: String {
        return ""
    }
    
    var message: String {
        return ""
    }
    
    var log: String {
        return ""
    }
    
    var code: Int  {
        return -1
    }
    
    var extra: Extra? {
        return nil
    }

}
