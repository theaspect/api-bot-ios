//
//  Const+Network.swift
//  bolshoe
//
//  Created by Anton Skorodumov on 18.01.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension Const {
    
    struct Network {
        
        static let debug: Bool = true
        static let developURL: String = "http://sensor.goodline.info"
        static let productionURL: String = "http://sensor.goodline.info"
        static let clientId: Int = 2
        static let secretId: String = "CGmyey0bwLthynoyXYqJJ543tPYlrJEWXCHcEx0I"
        
        static let requestTimeout: TimeInterval = 30
        static let connectionCount: Int = 4
        static let contentType: String = "application/json"
        static let multipartContentType: String = "multipart/form-data"
        
    }
}
