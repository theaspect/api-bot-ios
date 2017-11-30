//
//  UINavigationBar+Colorize.swift
//  vc
//
//  Created by Anton Skorodumov on 10.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    func configureBarWithoutShadow(withBackgroundColor backgroundColor: UIColor,
                                   textColor: UIColor) {
        setBackgroundImage(UIImage.image(with: backgroundColor),
                           for: UIBarMetrics.default)
        shadowImage = UIImage()
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: textColor]
        titleTextAttributes = titleDict as? [String: AnyObject]
    }
    
}
