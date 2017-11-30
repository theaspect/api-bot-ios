//
//  HTTPError.swift
//  safesensor
//
//  Created by Anton Skorodumov on 21.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum HTTPError {
    
    case httpResponseConvertation()
    case httpErrorWithRest(code: Int, extra: AnyObject?)
    case httpRequestNotFound()
    
}

extension HTTPError: ApplicationError {

    var title: String {
        switch self {
        case .httpRequestNotFound():
            return "Ошибка сети"
        case .httpResponseConvertation():
            return "Ошибка сети"
        case .httpErrorWithRest(_, _):
            return "Ошибка сети"
        }
    }
    
    var code: Int {
        switch self {
        case .httpRequestNotFound():
            return -10002
        case .httpResponseConvertation():
            return -10001
        case .httpErrorWithRest(code: let code, extra: _):
            return code
        }
    }
    
    var message: String {
        switch self {
        case .httpRequestNotFound():
            return "Ошибка сети"
        case .httpResponseConvertation():
            return "Ошибка сети"
        case .httpErrorWithRest(code: _, extra: _):
            return extra?.message ?? "Ошибка сети"
        }
    }
    
    var log: String {
        switch self {
        case .httpRequestNotFound():
            return "httpRequestNotFound"
        case .httpResponseConvertation():
            return "httpResponseConvertation"
        case .httpErrorWithRest(code: _, extra: _):
            return extra?.message ?? "Ошибка сети"
        }
    }
    
    var extra: Extra? {
        switch self {
        case .httpErrorWithRest(code: _, extra: let extra):
            return Extra(userData: extra as? [String: AnyObject])
        default:
            return nil
        }
    }

}

