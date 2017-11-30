//
//  AlertViewBuilder.swift
//  safesensor
//
//  Created by Anton Skorodumov on 24.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import UIKit

class AlertViewBuilderImpl {
    
    var alertViewController: UIAlertController?
    var window: WindowService!
    
    init(windowService: WindowService) {
        window = windowService
    }
    
}

extension AlertViewBuilderImpl: AlertViewBuilder {

    func createAlertController(title: String,
                               message: String,
                               style: UIAlertControllerStyle) -> AlertViewBuilder {
        alertViewController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertViewController?.title = title
        alertViewController?.message = message
        window.addPopover(to: alertViewController)
        return self
    }
    
    func addAction(title: String,
                   actionBlock: @escaping (UIAlertAction) -> Void) -> AlertViewBuilder {
        let okAction = UIAlertAction(title: title,
                                     style: .default,
                                     handler: actionBlock)
        alertViewController?.addAction(okAction)
        return self
    }
    
    func addCancelAction(title: String,
                         actionBlock: @escaping (UIAlertAction) -> Void) -> AlertViewBuilder {
        let cancelAction = UIAlertAction(title: title,
                                         style: .cancel,
                                         handler: actionBlock)
        alertViewController?.addAction(cancelAction)
        return self
    }
    
    func show() {
        guard let alert = alertViewController else { return }
        window.presentViewController(controller: alert)
    }
    
}
