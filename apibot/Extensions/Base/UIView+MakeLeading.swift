//
//  UIView+MakeLeading.swift
//  vc
//
//  Created by Anton Skorodumov on 01.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeViewLeadingForTheView(leadingView view: UIView) {
        self.frame = view.bounds
        let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let left = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let right = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(top)
        view.addConstraint(bottom)
        view.addConstraint(left)
        view.addConstraint(right)
    }
    
}
