//
//  Extra.swift
//  apibot
//
//  Created by Anton Skorodumov on 01.12.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

class Extra {
    
    struct Auth {
        
        static let failLoginPass: Int = 1
        static let unauthorize: Int = 2
        static let notExist: Int = 3
        static let invalid: Int = 4
        static let fatalError: Int = 5
        static let expired: Int = 6
        
    }
    
    var code: Int = 0
    var message: String = ""
    var fields: [String] = []
    var blockInterval: Int = 0
    
    init(userData: [String: AnyObject]?) {
        guard let userData = userData else {return}
        self.code = userData["code"] as? Int ?? 0
        self.message = userData["message"] as? String ?? ""
        self.blockInterval = userData["block_interval"] as? Int ?? 0
    }
    
}
