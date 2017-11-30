//
//  Array+Update.swift
//  vc
//
//  Created by Anton Skorodumov on 17.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    mutating func update(element: Element) {
        if let index = index(of: element) {
            self[index] = element
        }
        else {
            append(element)
        }
    }
    
}
