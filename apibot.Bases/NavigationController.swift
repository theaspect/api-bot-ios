//
//  NavigationController.swift
//  SpeechKitExample
//
//  Created by Anton Skorodumov on 17.09.16.
//  Copyright © 2016 chameleon. All rights reserved.
//

import UIKit

enum NavigationBarType {
    
    case auth
    case common
    case trunslucent
    case silvered
    
}

class NavigationController: UINavigationController {

    private var internalBarType: NavigationBarType?
    
    convenience init(rootViewController: UIViewController,
                     navigationBarType: NavigationBarType) {
        self.init(rootViewController: rootViewController)
        internalBarType = navigationBarType
        configureNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureNavigationBar() {
        switch (internalBarType) {
        case .auth?:
            navigationBar.configureBarWithoutShadow(withBackgroundColor: UIColor.white,
                                                    textColor: UIColor.black)
        case .common?:
            navigationBar.isTranslucent = false
            navigationBar.configureBarWithoutShadow(withBackgroundColor: UIColor.white,
                                                    textColor: UIColor.black)
        case .trunslucent?:
            navigationBar.configureBarWithoutShadow(withBackgroundColor: UIColor.clear,
                                                    textColor: UIColor.white)
        case .silvered?:
            navigationBar.isTranslucent = false
            navigationBar.configureBarWithoutShadow(withBackgroundColor: UIColor.white,
                                                    textColor: UIColor.black)
        case nil:
            navigationBar.isTranslucent = false
            navigationBar.configureBarWithoutShadow(withBackgroundColor: UIColor.white,
                                                    textColor: UIColor.black)
        }
    }
    
    override var shouldAutorotate : Bool {
        return topViewController?.shouldAutorotate ?? false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? [UIInterfaceOrientationMask.portrait]
    }
    
    override var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return topViewController?.preferredInterfaceOrientationForPresentation ?? UIInterfaceOrientation.portrait
    }
    
    func hiddenNavigatiolnBar() {
        navigationBar.isHidden = true
        navigationBar.isTranslucent = false
        navigationBar.isOpaque = true
        
    }
    
}
