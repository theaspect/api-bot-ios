//
//  BaseViewController.swift
//  capp
//
//  Created by Anton Skorodumov on 28.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - private variables
    
    // MARK: - view controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBackButton(nil,
                        color: UIColor.black,
                        action: #selector(BaseViewController.onBack))
    }
    
    // MARK: - private
    
    internal func onBack() {
        
    }
    
    internal func addModule(controllerView: UIViewController,
                            toContainer container: UIView) {
        var f = container.frame
        f.origin.x = 0
        f.origin.y = 0
        controllerView.view.frame = f
        container.addSubview(controllerView.view)
        addChildViewController(controllerView)
    }

    override var shouldAutorotate : Bool
    {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask
    {
        return [UIInterfaceOrientationMask.portrait, UIInterfaceOrientationMask.landscape]
    }
    
}

extension BaseViewController: BaseViewInput {

    func showToast(with message: String) {
        view.createToast(message: message)
    }

}
