//
//  UIView+AddRefreshControll.swift
//  vc
//
//  Created by Anton Skorodumov on 01.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addRefreshControl(target: AnyObject, action: Selector) -> UIRefreshControl {
        let refreshControl: UIRefreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: action, for: UIControlEvents.valueChanged)
        addSubview(refreshControl)
        return refreshControl
    }
    
}
