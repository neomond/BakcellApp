//
//  TabBarConfigurator.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

final class TabBarConfigurator {
    
    @discardableResult
    static func configure(_ viewController: TabBarController) -> TabBarController {
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter()
        let router = TabBarRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
