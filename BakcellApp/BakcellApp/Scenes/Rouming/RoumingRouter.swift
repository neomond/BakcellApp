//
//  RoumingRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

@objc protocol RoumingRoutingLogic {
    
    //func routeToSomewhere()
}

protocol RoumingDataPassing {
    var dataStore: RoumingDataStore? { get }
}

final class RoumingRouter: NSObject, RoumingRoutingLogic, RoumingDataPassing {
    
    weak var viewController: RoumingViewController?
    var dataStore: RoumingDataStore?
  
    
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

//    func navigateToSomewhere(source: RoumingViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: RoumingDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
