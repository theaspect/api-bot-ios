//
//  BaseInteractorOutput.swift
//  vc
//
//  Created by Anton Skorodumov on 01.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol BaseInteractorOutput: class {
    
    func processError(with title: String,
                      message: String,
                      fields: [String]?)
    
}
