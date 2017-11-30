//
//  Const+UI.swift
//  vc
//
//  Created by Anton Skorodumov on 27.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension Const {
    
    struct UI {
        
        static let screenSize: CGRect = UIScreen.main.bounds
        static let landscapeScreenSize: CGRect = CGRect(x: 0, y: 0, width: screenSize.height, height: screenSize.width)
        static let estimatedRowHeight: CGFloat = 60.0
        static let navigationBarHeight: CGFloat = 64.0
        static let navigationBarScrollingDelay: Double = 50.0
        static let keyboardToolbarHeight: CGFloat = 50.0
        
    }
    
}
