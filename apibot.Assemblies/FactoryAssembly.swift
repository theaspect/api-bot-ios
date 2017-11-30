//
//  FactoryAssembly.swift
//  vc
//
//  Created by Anton Skorodumov on 25.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import Swinject

class FactoryAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ControllerFactory.self) {r in ControllerFactory(mainContainer: container) }
        
        container.register(ImagePickerFactoryImpl.self) {r in ImagePickerFactoryImpl() }
        
    }
}
