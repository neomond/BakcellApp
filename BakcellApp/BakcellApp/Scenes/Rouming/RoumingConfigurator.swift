//
//  RoumingConfigurator.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

final class RoumingConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingViewController) -> RoumingViewController {
        let view = RoumingView()
        let interactor = RoumingInteractor()
        let presenter = RoumingPresenter()
        let router = RoumingRouter()
        
        viewController.mainView = view
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
