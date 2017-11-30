//
//  RepositoryError.swift
//  vc
//
//  Created by Anton Skorodumov on 01.08.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

enum RepositoryError {
    
    case archiveStreamNotExist()
    case noDataFound()
    
}

extension RepositoryError: ApplicationError {
    
    var title: String {
        switch self {
        case .archiveStreamNotExist():
            return "Архив не найден"
        case .noDataFound():
            return "Данные не получены"
        }
    }
    
    var code: Int {
        switch self {
        case .archiveStreamNotExist():
            return -10100
        case .noDataFound():
            return -10101
        }
    }
    
    var message: String {
        switch self {
        case .archiveStreamNotExist():
            return "Архив не найден"
        case .noDataFound():
            return "Данные не получены"
        }
    }
    
    var log: String {
        switch self {
        case .archiveStreamNotExist():
            return "Архив не найден"
        case .noDataFound():
            return "Данные не получены"
        }
    }
    
    var extra: Extra? {
        return nil
    }
    
}
