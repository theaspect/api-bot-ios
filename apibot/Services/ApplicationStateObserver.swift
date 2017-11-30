//
//  ApplicationObserver.swift
//  vc
//
//  Created by Anton Skorodumov on 05.06.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol ApplicationStateListener: class {
    
    func add(listener: ApplicationStateObservable)
    
    func remove(listener: ApplicationStateObservable)
    
}

protocol ApplicationStateObservable: class {
    
}

protocol ApplicationStateResignActiveObservable: ApplicationStateObservable {
    
    func applicationWillResignActive()
    
}

protocol ApplicationStateEnterBackgroundObservable: ApplicationStateObservable {
    
    func applicationDidEnterBackground()
    
}

protocol ApplicationStateEnterForegroundObservable: ApplicationStateObservable {
    
    func applicationWillEnterForeground()
    
}

protocol ApplicationStateBecomeActiveObservable: ApplicationStateObservable {
    
    func applicationDidBecomeActive()
    
}

protocol ApplicationStateTerminateObservable: ApplicationStateObservable {
    
    func applicationWillTerminate()
    
}

class ApplicationStateObserver: ApplicationStateListener {
    
    var listeners: [ApplicationStateObservable]!
    
    init() {
        listeners = [ApplicationStateObservable]()
    }
    
    func add(listener: ApplicationStateObservable) {
        listeners.append(listener)
    }
    
    func remove(listener: ApplicationStateObservable) {
        listeners = listeners.filter{ $0 !== listener }
    }
    
    func applicationWillResignActive() {
        listeners.forEach { (listener) in
            if let listener = listener as? ApplicationStateResignActiveObservable {
                listener.applicationWillResignActive()
            }
        }
    }
    
    func applicationDidEnterBackground() {
        listeners.forEach { (listener) in
            if let listener = listener as? ApplicationStateEnterBackgroundObservable {
                listener.applicationDidEnterBackground()
            }
        }
    }
    
    func applicationWillEnterForeground() {
        listeners.forEach { (listener) in
            if let listener = listener as? ApplicationStateEnterForegroundObservable {
                listener.applicationWillEnterForeground()
            }
        }
    }
    
    func applicationDidBecomeActive() {
        listeners.forEach { (listener) in
            if let listener = listener as? ApplicationStateBecomeActiveObservable {
                listener.applicationDidBecomeActive()
            }
        }
    }
    
    func applicationWillTerminate() {
        listeners.forEach { (listener) in
            if let listener = listener as? ApplicationStateTerminateObservable {
                listener.applicationWillTerminate()
            }
        }
    }
    
}
