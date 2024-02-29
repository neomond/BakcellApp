//
//  PackageDescriptionRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

@objc protocol PackageDescriptionRoutingLogic {
    
    //func routeToSomewhere()
}

protocol PackageDescriptionDataPassing {
    var dataStore: PackageDescriptionDataStore? { get }
}

final class PackageDescriptionRouter: NSObject, PackageDescriptionRoutingLogic, PackageDescriptionDataPassing {
    
    weak var viewController: PackageDescriptionViewController?
    var dataStore: PackageDescriptionDataStore?
  
    
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

//    func navigateToSomewhere(source: PackageDescriptionViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: PackageDescriptionDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
