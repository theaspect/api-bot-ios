//
//  TestBaseInteractor.swift
//  capp
//
//  Created by Anton Skorodumov on 28.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation

class BaseInteractor {
    
    weak var baseOutput: BaseInteractorOutput?

    func process(error: ApplicationError?) {
        guard let error = error else {
            return
        }
        guard error.code != 401 else { return }
        baseOutput?.processError(with: error.title, message: error.message, fields: error.extra?.fields)
    }
    
}
