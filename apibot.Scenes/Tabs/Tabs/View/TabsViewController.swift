//
//  TabsTabsViewController.swift
//  capp
//
//  Created by Skorodumov Anton on 20/10/2016.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController {

    // MARK: - const
    
    fileprivate let ADD_WIDTH: CGFloat = 60.0
    fileprivate let ADD_HEIGHT: CGFloat = 60.0
    
    // MARK: - property

    var output: TabsViewOutput!
    
    // MARK: - outlets
    
    // MARK: - initial
    
    

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configureTabBar()
        output?.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = 0
        viewControllers = output?.getControllers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - private class function
    
    fileprivate func configureTabBar()
    {
        tabBar.backgroundImage = nil
//        tabBar.capp_applyBlur(.Light)
        tabBar.tintColor = UIColor.green
        //UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.grayColor()], forState: .Normal)
        //UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Selected)
    }

}

extension TabsViewController: TabsViewInput {
    
    func setupInitialState() {
    }
    
}

extension TabsViewController: UITabBarControllerDelegate {
    
    
}
