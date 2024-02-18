//
//  TabBarRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

@objc protocol TabBarRoutingLogic {
    
    //func routeToSomewhere()
}

protocol TabBarDataPassing {
    var dataStore: TabBarDataStore? { get }
}

final class TabBarRouter: NSObject, TabBarRoutingLogic, TabBarDataPassing {
    
    weak var viewController: TabBarController?
    var dataStore: TabBarDataStore?
  
    
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

//    func navigateToSomewhere(source: TabBarViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: TabBarDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
