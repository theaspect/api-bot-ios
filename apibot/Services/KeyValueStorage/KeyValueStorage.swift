//
//  KeyValueStorage.swift
//  safesensor
//
//  Created by Anton Skorodumov on 14.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

class KeyValueStorage {
    
    private var userDefaults: UserDefaults!
    
    init() {
        userDefaults = UserDefaults.standard
    }
    
    var deviceToken: String? {
        get { return userDefaults.value(forKey: KeyStorage.deviceTokenKey) as? String }
        set {
            userDefaults.set(newValue, forKey: KeyStorage.deviceTokenKey)
            userDefaults.synchronize()
        }
    }
    
    var needCheckHomeLocation: Bool? {
        get { return userDefaults.value(forKey: KeyStorage.needCheckHomeLocationKey) as? Bool ?? true }
        set {
            userDefaults.set(newValue, forKey: KeyStorage.needCheckHomeLocationKey)
            userDefaults.synchronize()
        }
    }
    
    var userStep: UserStep {
        get {
            guard let step = UserStep(rawValue: userDefaults.integer(forKey: KeyStorage.userStepKey)) else { return .auth }
            return step
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: KeyStorage.userStepKey)
            userDefaults.synchronize()
        }
    }
    
}
