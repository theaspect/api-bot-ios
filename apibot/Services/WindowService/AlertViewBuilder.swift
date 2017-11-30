//
//  AlertViewBuilder.swift
//  safesensor
//
//  Created by Anton Skorodumov on 24.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

protocol AlertViewBuilder {
    
    func createAlertController(title: String,
                               message: String,
                               style: UIAlertControllerStyle) -> AlertViewBuilder
    func addAction(title: String,
                   actionBlock: @escaping (UIAlertAction) -> Void) -> AlertViewBuilder
    
    func addCancelAction(title: String,
                         actionBlock: @escaping (UIAlertAction) -> Void) -> AlertViewBuilder
    
    func show()
    
}
