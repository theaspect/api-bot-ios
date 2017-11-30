//
//  MainContainer.swift
//  SpeechKitExample
//
//  Created by Anton Skorodumov on 10.09.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class MainContainer
{

    var c: Container!
    
    init() {
        c = Container()
        let assembler = Assembler(container: c)
        assembler.apply(assemblies: [RepositoriesAssembly(),
                                     ServicesAssembly(),
                                     ControllersAssembly(),
                                     FactoryAssembly(),
                                     CoordinatorAssembly(),
                                     NotificationProcessingAssembly()])
    }
    
    func start() {
        let starter: StartService = c.resolve(StartServiceImpl.self)!
        starter.start()
    }
    
}
