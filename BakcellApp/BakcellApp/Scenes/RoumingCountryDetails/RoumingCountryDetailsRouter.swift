//
//  RoumingCountryDetailsRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit

@objc protocol RoumingCountryDetailsRoutingLogic {
    
    //func routeToSomewhere()
}

protocol RoumingCountryDetailsDataPassing {
    var dataStore: RoumingCountryDetailsDataStore? { get }
}

final class RoumingCountryDetailsRouter: NSObject, RoumingCountryDetailsRoutingLogic, RoumingCountryDetailsDataPassing {
    
    weak var viewController: RoumingCountryDetailsViewController?
    var dataStore: RoumingCountryDetailsDataStore?
  
    
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

//    func navigateToSomewhere(source: RoumingCountryDetailsViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: RoumingCountryDetailsDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
