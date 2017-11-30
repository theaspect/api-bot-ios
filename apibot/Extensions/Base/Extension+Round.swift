//
//  Double+Round.swift
//  vc
//
//  Created by Anton Skorodumov on 14.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension Double {

    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}

extension Float {
    
    func round(to places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
    
}

extension CGFloat {
    
    func round(to places: Int) -> CGFloat {
        let divisor: CGFloat = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toInt() -> Int {
        if self.isNaN || self.isInfinite {
            return 0
        }
        return Int(self)
    }
    
}
