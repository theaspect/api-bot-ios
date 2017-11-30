//
//  Dictionary+ParamsToString.swift
//  vc
//
//  Created by Anton Skorodumov on 21.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        let parameterArray = map { (key, value) -> String in
            let percentEscapedKey = (key as! String).stringByAddingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = String(describing: (value as AnyObject)).stringByAddingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
    
}

