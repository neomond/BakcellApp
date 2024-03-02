//
//  SupportedCountriesRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

@objc protocol SupportedCountriesRoutingLogic {
    
    //func routeToSomewhere()
}

protocol SupportedCountriesDataPassing {
    var dataStore: SupportedCountriesDataStore? { get }
}

final class SupportedCountriesRouter: NSObject, SupportedCountriesRoutingLogic, SupportedCountriesDataPassing {
    
    weak var viewController: SupportedCountriesViewController?
    var dataStore: SupportedCountriesDataStore?
  
    
    // MARK: Routing

//    func routeToSomewhere() {
//        let destinationVC = SomewhereViewController()
//        SomewhereConfigurator.configure(destinationVC)
//
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }

    
    // MARK: Navigation

//    func navigateToSomewhere(source: SupportedCountriesViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: SupportedCountriesDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
