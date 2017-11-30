//
//  CommonError.swift
//  safesensor
//
//  Created by Anton Skorodumov on 21.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum CommonError {
    
    case nsError(NSError?)
    case error(Error?)
    
}

extension CommonError: ApplicationError {
    
    var message: String {
        switch self {
        case .nsError(_):
            return "Ошибка сети"
        case .error(_):
            return "Ошибка сети"
        }
    }
    
    var log: String {
        switch self {
        case .nsError(let error):
            return error?.domain ?? ""
        case .error(let error):
            return error?.localizedDescription ?? ""
        }
    }
    
    
    var code: Int  {
        switch self {
        case .nsError(let error):
            return error?.code ?? 0
        case .error(_):
            return -1
        }
    }

    var extra: Extra? {
        switch self {
        case .nsError(let error):
            return Extra(userData: error?.userInfo as? [String: AnyObject])
        case .error(_):
            return nil
        }
    }
            
}
