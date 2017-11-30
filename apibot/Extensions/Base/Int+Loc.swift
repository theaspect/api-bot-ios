//
//  Number+Loc.swift
//  capp
//
//  Created by Андрей Гутов on 26.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

extension Int {
    func locTime(_ key: String, suffix: String = "") -> String
    {
        // in Localized need named (key, key-4, key-5)
        var string = ""
        var i = 0
        
        // seconds
        if (self >= 11 && self <= 19)
        {
            string = "\(self) " + loc(key + "-5")
        }
        else {
            i = self % 10
            switch (i)
            {
            case 1: string = "\(self) " + loc(key)
            case 2, 3, 4: string = "\(self) " + loc(key + "-4")
            default: string = "\(self) " + loc(key + "-5")
            }
        }
        return string + " " + suffix
    }
    
    func locGetKey(_ key: String) -> String {
        var string = ""
        var i = 0
        
        // seconds
        if (self >= 11 && self <= 19)
        {
            string = loc(key + "-5")
        }
        else {
            i = self % 10
            switch (i)
            {
            case 1: string = loc(key)
            case 2, 3, 4: string = loc(key + "-4")
            default: string = loc(key + "-5")
            }
        }
        return string
    }
}
