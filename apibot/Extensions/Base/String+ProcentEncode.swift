//
//  String+ProcentEncode.swift
//  vc
//
//  Created by Anton Skorodumov on 21.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension String {
    func stringByAddingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        
        return addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
    
}
