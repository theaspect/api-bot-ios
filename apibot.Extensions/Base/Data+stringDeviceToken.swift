//
//  Data+generateDeviceToken.swift
//  safesensor
//
//  Created by Anton Skorodumov on 13.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation


extension Data {
    
    func stringDeviceToken() -> String {
        return self.map { String(format: "%02.2hhx", $0) }.joined()
    }
    
}
