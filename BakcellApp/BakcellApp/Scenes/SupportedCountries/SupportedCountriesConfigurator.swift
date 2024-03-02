//
//  SupportedCountriesConfigurator.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

final class SupportedCountriesConfigurator {
    
    @discardableResult
    static func configure(_ viewController: SupportedCountriesViewController) -> SupportedCountriesViewController {
        let view = SupportedCountriesView()
        let interactor = SupportedCountriesInteractor()
        let presenter = SupportedCountriesPresenter()
        let router = SupportedCountriesRouter()
        
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
