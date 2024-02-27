//
//  RoumingCountryDetailsConfigurator.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit

final class RoumingCountryDetailsConfigurator {
    
    @discardableResult
    static func configure(_ viewController: RoumingCountryDetailsViewController) -> RoumingCountryDetailsViewController {
        let view = RoumingCountryDetailsView()
        let interactor = RoumingCountryDetailsInteractor()
        let presenter = RoumingCountryDetailsPresenter()
        let router = RoumingCountryDetailsRouter()
        
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
