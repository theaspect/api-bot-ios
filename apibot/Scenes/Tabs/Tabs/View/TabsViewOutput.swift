//
//  TabsTabsViewOutput.swift
//  capp
//
//  Created by Skorodumov Anton on 20/10/2016.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

protocol TabsViewOutput {

    /**
        @author Skorodumov Anton
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    /**
     @author Skorodumov Anton
     Запросить контроллеры
     */
    func getControllers() -> [UIViewController]

}
