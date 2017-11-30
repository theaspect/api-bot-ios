//
//  Dictionary+ToData.swift
//  vc
//
//  Created by Anton Skorodumov on 21.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: AnyObject {

    func toData() -> Data? {
        if let d = (self as AnyObject) as? Dictionary<String, AnyObject> {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: d, options: JSONSerialization.WritingOptions.prettyPrinted)
                return jsonData
            } catch {
                return nil
            }
        }
        return nil
    }
    
}
