//
//  TestBaseRouter.swift
//  capp
//
//  Created by Anton Skorodumov on 28.10.16.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter {
    
    weak var routerController: UIViewController?
    
    init(controller: UIViewController) {
        routerController = controller
    }
    
}
