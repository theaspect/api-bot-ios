//
//  BaseControllerFactory.swift
//  safesensor
//
//  Created by Anton Skorodumov on 06.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol AbstractInputDataModel: class {
    
}

class BaseControllerFactory<T, Y: AbstractInputDataModel>: BaseFactory {
    
    func controller(input: Y) -> T? {
        return nil
    }
    
}
