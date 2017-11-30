//
//  TabNavigationController.swift
//  capp
//
//  Created by Anton Skorodumov on 21.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

class TabNavigationController: NavigationController {
    
    convenience init(rootViewController: UIViewController,
                     title: String?,
                     image: UIImage?) {
        self.init(rootViewController: rootViewController)
        tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: image)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
