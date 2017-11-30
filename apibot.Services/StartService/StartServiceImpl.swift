//
//  StartServiceImpl.swift
//  capp
//
//  Created by Андрей Гутов on 06.02.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

class StartServiceImpl: StartService {
    
    private var configure: ServiceConfigurable!
    private var windowService: WindowService!
    private var keyValueStorage: KeyValueStorage!
    
    init(configurator: ServiceConfigurable,
         window: WindowService,
         keyValueStorage keyValue: KeyValueStorage) {
        configure = configurator
        windowService = window
        keyValueStorage = keyValue
    }
    
    func start() {
        configureServices()
        
    }
    
    func configureServices() {
        configure.cache()
    }
}
