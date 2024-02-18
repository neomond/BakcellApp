//
//  DashboardRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

@objc protocol DashboardRoutingLogic {
    
    //func routeToSomewhere()
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

final class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing {
    
    weak var viewController: DashboardViewController?
    var dataStore: DashboardDataStore?
  
    
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

//    func navigateToSomewhere(source: DashboardViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: DashboardDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
