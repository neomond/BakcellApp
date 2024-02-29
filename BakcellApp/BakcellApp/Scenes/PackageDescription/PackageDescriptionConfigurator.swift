//
//  PackageDescriptionConfigurator.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

final class PackageDescriptionConfigurator {
    
    @discardableResult
    static func configure(_ viewController: PackageDescriptionViewController) -> PackageDescriptionViewController {
        let view = PackageDescriptionView()
        let interactor = PackageDescriptionInteractor()
        let presenter = PackageDescriptionPresenter()
        let router = PackageDescriptionRouter()
        
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
