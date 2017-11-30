//
//  BaseViewInput.swift
//  vc
//
//  Created by Anton Skorodumov on 12.05.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol BaseViewInput: class {
    
    /**
    @author chameleon
     Показить сообщение в тост вью
     */
    func showToast(with message: String)
    
}
