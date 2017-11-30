//
//  Data+ToDictionary.swift
//  vc
//
//  Created by Anton Skorodumov on 19.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation


extension Data {
    
    var serialize: AnyObject? {
        do {
            let dict = try JSONSerialization.jsonObject(with: self, options: []) as AnyObject
            return dict
        } catch {}
        return nil
    }
    
}
