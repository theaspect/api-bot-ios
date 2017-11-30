//
//  String+deserialize.swift
//  safesensor
//
//  Created by Anton Skorodumov on 17.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension String {
    
    func deserialize() -> AnyObject? {
        let data = self.data(using: .utf8)
        return data?.serialize
    }
    
}
