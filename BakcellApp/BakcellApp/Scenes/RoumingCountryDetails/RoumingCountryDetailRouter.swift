//
//  RoumingCountryDetailRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

@objc protocol RoumingCountryDetailRoutingLogic {
    
    //func routeToSomewhere()
}

protocol RoumingCountryDetailDataPassing {
    var dataStore: RoumingCountryDetailDataStore? { get }
}

final class RoumingCountryDetailRouter: NSObject, RoumingCountryDetailRoutingLogic, RoumingCountryDetailDataPassing {
    
    weak var viewController: RoumingCountryDetailViewController?
    var dataStore: RoumingCountryDetailDataStore?
  
    
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

//    func navigateToSomewhere(source: RoumingCountryDetailViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: RoumingCountryDetailDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
