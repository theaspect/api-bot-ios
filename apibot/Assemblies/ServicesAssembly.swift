//
//  ServicesAssembly.swift
//  vc
//
//  Created by Anton Skorodumov on 24.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class ServicesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(WindowServiceImpl.self) {r in WindowServiceImpl()}.inObjectScope(ObjectScope.container)
        
        container.register(LocalFileManagerImpl.self) {r in LocalFileManagerImpl()}
        
        container.register(ServiceConfiguratorImpl.self) {r in ServiceConfiguratorImpl(application: UIApplication.shared)}
        container.register(StartServiceImpl.self) {r in StartServiceImpl(configurator: r.resolve(ServiceConfiguratorImpl.self)!,
                                                                         window: r.resolve(WindowServiceImpl.self)!,
                                                                         keyValueStorage: r.resolve(KeyValueStorage.self)!)}

        container.register(ApplicationStateObserver.self) {r in ApplicationStateObserver() }
        
        container.register(KeyValueStorage.self) {r in KeyValueStorage() }
        
        container.register(AlertViewBuilderImpl.self) { r in AlertViewBuilderImpl(windowService: r.resolve(WindowServiceImpl.self)!) }
        

    }
    
}
