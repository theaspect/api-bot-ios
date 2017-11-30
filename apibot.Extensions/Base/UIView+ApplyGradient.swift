//
//  UIView+ApplyGradient.swift
//  safesensor
//
//  Created by Anton Skorodumov on 30.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func applyGradient(fromColor: UIColor,
                       toColor: UIColor,
                       withFrame: CGRect) -> CAGradientLayer? {
        let gradient = CAGradientLayer()
        gradient.colors = [fromColor.cgColor, toColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.frame = CGRect(x: 0,
                                y: 0,
                                width: withFrame.size.width,
                                height: withFrame.size.height)
        layer.addSublayer(gradient)
        gradient.zPosition = -1
        return gradient
    }
    
}
