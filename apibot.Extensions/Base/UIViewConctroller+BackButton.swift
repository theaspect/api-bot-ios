//
//  UIViewConctroller+BackButton.swift
//  vc
//
//  Created by Anton Skorodumov on 25.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupBackButton(_ image: UIImage?,
                         color: UIColor?,
                         action: Selector) {
        navigationController?.navigationBar.backIndicatorImage = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let backButton = UIBarButtonItem(title: " ",
                                         style: UIBarButtonItemStyle.plain,
                                         target: self,
                                         action: action)
        navigationController?.navigationBar.tintColor = color
        navigationItem.backBarButtonItem = backButton
    }
}
