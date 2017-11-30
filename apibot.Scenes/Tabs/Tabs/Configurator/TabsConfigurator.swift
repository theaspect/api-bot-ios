//
//  TabsTabsConfigurator.swift
//  capp
//
//  Created by Skorodumov Anton on 20/10/2016.
//  Copyright © 2016 E-Lite-Telecom. All rights reserved.
//

import UIKit

class TabsModuleConfigurator {

    // MARK - initial

    static func configure(controllers: [TabNavigationController]) -> TabsViewController {
        let tabsViewController = TabsViewController()

        let router = TabsRouter(controller: tabsViewController)

        let presenter = TabsPresenter(controllers: controllers)
        presenter.view = tabsViewController
        presenter.router = router

        let interactor = TabsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        tabsViewController.output = presenter
        
        return tabsViewController
    }
    
}
