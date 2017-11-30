//
//  Common.swift
//  SpeechKitExample
//
//  Created by Anton Skorodumov on 17.09.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation

// short version of NSLocalizedString
func loc(_ key: String) -> String
{
    return NSLocalizedString(key, comment: "")
}

func loc(_ key: String, parameters: CVarArg ...) -> String
{
    return String(format: NSLocalizedString(key, comment: ""), arguments: parameters)
}

func loc(_ key: String, fromTable: String) -> String
{
    return NSLocalizedString(key, tableName: fromTable, bundle: Bundle.main, value: "", comment: "")
}
