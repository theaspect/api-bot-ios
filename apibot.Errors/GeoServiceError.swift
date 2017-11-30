//
//  GeoServiceError.swift
//  safesensor
//
//  Created by Anton Skorodumov on 21.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum GeoServiceError {
    
    case geoServicePermitionsUnavailable()
    case geoServiceEmptyLocationCoordinated()
    case locationManagerDisabled()
    
}

extension GeoServiceError: ApplicationError {
    
    var code: Int {
        switch self {
        case .geoServicePermitionsUnavailable():
            return -10003
        case .geoServiceEmptyLocationCoordinated():
            return -10004
        case .locationManagerDisabled():
            return -10005
        }
    }
        
}
