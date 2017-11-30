//
//  UIView+RoundImage.swift
//  capp
//
//  Created by Anton Skorodumov on 28.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeRoundByMinSide()
    {
        var radius = frame.width
        if frame.width > frame.height
        {
            radius = frame.height
        }
        layer.cornerRadius = radius / 2
        layer.masksToBounds = true
    }
    
    func makeRoundWithRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    
}
