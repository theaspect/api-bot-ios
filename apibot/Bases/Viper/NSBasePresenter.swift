//
//  NSBasePresenter.swift
//  vc
//
//  Created by Anton Skorodumov on 02.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

class NSBasePresenter: NSObject {
    
    var controllerTitle: String = ""
    weak var baseView: BaseViewInput?
    
}

extension NSBasePresenter: BaseInteractorOutput {
    
    func processError(with title: String, message: String, fields: [String]?) {
        baseView?.showToast(with: message)
    }
    
}
