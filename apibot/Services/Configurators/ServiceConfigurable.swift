//
//  ServiceConfigurator.swift
//  capp
//
//  Created by Anton Skorodumov on 11.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol ServiceConfigurable: class {

    /**
     @author chamleon
     Настройка уведомлений
     */
    func notification()
    
    /**
     @author chamleon
     Настройка url кеша
     */
    func cache()
    
}
