//
//  RoumingRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

@objc protocol RoumingRoutingLogic {
    
    func routeToCountryDetail()
}

protocol RoumingDataPassing {
    var dataStore: RoumingDataStore? { get }
}

final class RoumingRouter: NSObject, RoumingRoutingLogic, RoumingDataPassing {
    
    weak var viewController: RoumingViewController?
    var dataStore: RoumingDataStore?
  
    
    // MARK: Routing

    func routeToCountryDetail() {
        let destinationVC = RoumingCountryDetailsViewController()
        RoumingCountryDetailsConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToCountryDetail(source: dataStore!, destination: &destinationDS)

        navigateToCountryDetail(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToCountryDetail(source: RoumingViewController, destination: RoumingCountryDetailsViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data

    func passDataToCountryDetail(source: RoumingDataStore, destination: inout RoumingCountryDetailsDataStore) {
        destination.countryName = source.countryName
    }
}
