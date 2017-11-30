//
//  UITableViewCell+Identified.swift
//  safesensor
//
//  Created by Anton Skorodumov on 07.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static func identifier() -> String {
        return String(describing: self.self)
    }
    
}
