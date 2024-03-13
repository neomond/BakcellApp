//
//  PackageDescriptionRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

@objc protocol PackageDescriptionRoutingLogic {
    
   func routeToSupportedCountries()
}

protocol PackageDescriptionDataPassing {
    var dataStore: PackageDescriptionDataStore? { get }
}

final class PackageDescriptionRouter: NSObject, PackageDescriptionRoutingLogic, PackageDescriptionDataPassing {
    
    weak var viewController: PackageDescriptionViewController?
    var dataStore: PackageDescriptionDataStore?
  
    
    // MARK: Routing

    func routeToSupportedCountries() {
        let destinationVC = SupportedCountriesViewController()
        SupportedCountriesConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToSupportedCountries(source: dataStore!, destination: &destinationDS)

        navigateToSupportedCountries(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToSupportedCountries(source: PackageDescriptionViewController, destination: SupportedCountriesViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data

    func passDataToSupportedCountries(source: PackageDescriptionDataStore, destination: inout SupportedCountriesDataStore) { }
}
