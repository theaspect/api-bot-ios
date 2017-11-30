//
//  WindowService.swift
//  SpeechKitExample
//
//  Created by Anton Skorodumov on 17.09.16.
//  Copyright © 2016 chameleon. All rights reserved.
//

import UIKit

class WindowServiceImpl {
    
    // MARK: - private variables
    
    fileprivate var window: UIWindow!
    fileprivate var isVisible: Bool!
    
    // MARK: - initial
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        isVisible = false
    }
    
    convenience init(level: UIWindowLevel) {
        self.init()
        window.windowLevel = level
    }
    
}

extension WindowServiceImpl: WindowService {
    
    func setRootViewController(_ controller: UIViewController?) {
        guard let controller = controller else { return }
        window.rootViewController = controller
        if isVisible == false {
            window.makeKeyAndVisible()
            isVisible = true
        }
    }
    
    func makeVisible() {
        isVisible = true
        window.makeKeyAndVisible()
    }
    
    func makeInvisible() {
        isVisible = false
        window.isHidden = true
    }
    
    func pushViewController(controller: UIViewController?) {
        guard let controller = controller else { return }
        (window.rootViewController as? UINavigationController)?.pushViewController(controller, animated: true)
    }
    
    func presentViewController(controller: UIViewController?) {
        guard let controller = controller else { return }
        if window.rootViewController?.presentedViewController == nil {
            window.rootViewController?.present(controller, animated: true, completion: nil)
        }
        else {
            window.rootViewController?.presentedViewController?.present(controller, animated: true, completion: nil)
        }
    }
    
    func addPopover(to alertController: UIAlertController?) {
        alertController?.popoverPresentationController?.sourceView = window.rootViewController?.view
    }
    
}
