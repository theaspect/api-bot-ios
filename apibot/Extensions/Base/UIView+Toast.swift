//
//  UIView + UIView.swift
//  safesensor
//
//  Created by chameleon
//  Copyright (c) E-Lite-Telecom. All rights reserved.
//

import UIKit

extension UIView {
    
    func createToast(message: String) {
        
    }
    
    func showSnackbar(height: CGFloat,
                      title: String?,
                      buttonTitle: String?,
                      interval: TimeInterval,
                      userData: [String: AnyObject?]? = nil,
                      tapButtonAction: (([String: AnyObject?]?) -> Void)? = nil,
                      closeAction: (([String: AnyObject?]?) -> Void)? = nil) {
        var frame = CGRect(x: 0, y: Const.UI.screenSize.height, width: Const.UI.screenSize.width, height: height)
        let bar = SnackToast(frame: frame,
                             title: title,
                             buttonTitle: buttonTitle,
                             interval: interval,
                             userData: userData,
                             tapButtonAction: tapButtonAction,
                             closeAction: closeAction)
        addSubview(bar)
        UIView.animate(withDuration: 0.25) {
            frame.origin.y -= height
            bar.frame = frame
        }
    }
    
}
