//
//  AppDelegate.swift
//  vc
//
//  Created by E-Lite-Telecom on 13.01.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var container: MainContainer!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        container = MainContainer()
        container.start()
        return true
    }

}

