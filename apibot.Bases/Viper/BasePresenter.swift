//
//  BasePresenter.swift
//  vc
//
//  Created by Anton Skorodumov on 25.04.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

class BasePresenter {
    
    var controllerTitle: String = ""
    weak var baseView: BaseViewInput?
    
}

extension BasePresenter: BaseInteractorOutput {
    
    func processError(with title: String, message: String, fields: [String]?) {
        guard message != "" else { return }
        baseView?.showToast(with: message)
    }
    
}
