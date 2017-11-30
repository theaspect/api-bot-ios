//
//  Const.swift
//  bolshoe
//
//  Created by Anton Skorodumov on 13.12.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation

struct Const {
    

    static let appVersion: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    static let buildVersion: String = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    static let version: String = appVersion + "." + buildVersion
 
    static let photoLibararyEventsAlbum: String = "Датчик спокойствия"
    
}
