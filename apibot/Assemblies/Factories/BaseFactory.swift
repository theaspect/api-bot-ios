//
//  BaseFactory.swift
//  vc
//
//  Created by Anton Skorodumov on 25.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import Swinject

class BaseFactory {
    
    internal var container: Container!
    
    init(mainContainer: Container) {
        container = mainContainer
    }
    
}
