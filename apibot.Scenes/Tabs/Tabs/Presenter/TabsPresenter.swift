//
//  TabsTabsPresenter.swift
//  capp
//
//  Created by Skorodumov Anton on 20/10/2016.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

class TabsPresenter: BasePresenter, TabsModuleInput, TabsInteractorOutput {

    // MARK: - property 

    weak var view: TabsViewInput!
    var interactor: TabsInteractorInput!
    var router: TabsRouterInput!
    
    fileprivate var controllers: [NavigationController]!
    
    // MARK: - initial
    
    init(controllers: [TabNavigationController]) {
        self.controllers = controllers
    }

}

extension TabsPresenter: TabsViewOutput {

    func viewIsReady() {
    }
    
    func getControllers() -> [UIViewController] {
        return controllers
    }
        
}


