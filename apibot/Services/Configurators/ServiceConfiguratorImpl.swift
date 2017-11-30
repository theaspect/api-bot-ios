//
//  ServiceConfigurator.swift
//  SpeechKitExample
//
//  Created by Anton Skorodumov on 17.09.16.
//  Copyright © 2016 chameleon. All rights reserved.
//

import UIKit

class ServiceConfiguratorImpl: ServiceConfigurable {

    // MARK: - private variables
    
    fileprivate var app: UIApplication!
    
    // MARK: - initial
    
    init(application: UIApplication) {
        app = application
    }
    
    // MARK: - public functions
    
    func notification() {
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound],
                                                                              categories: nil)
        app.registerUserNotificationSettings(settings)
        app.registerForRemoteNotifications()
    }

    func cache() {
        let urlCache = URLCache(memoryCapacity: 10 * 1024 * 1024,
                                diskCapacity: 40 * 1024 * 1024,
                                diskPath: nil)
        URLCache.shared = urlCache
    }
    
}
