//
//  RoumingRouter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

@objc protocol RoumingRoutingLogic {
    
    func routeToCountryDetail()
    func routeToRoumingPackageDetail()
}

protocol RoumingDataPassing {
    var dataStore: RoumingDataStore? { get }
}

final class RoumingRouter: NSObject, RoumingRoutingLogic, RoumingDataPassing {
    
    weak var viewController: RoumingViewController?
    var dataStore: RoumingDataStore?
  
    
    // MARK: Routing

    func routeToCountryDetail() {
        let destinationVC = RoumingCountryDetailViewController()
        RoumingCountryDetailConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToCountryDetail(source: dataStore!, destination: &destinationDS)

        navigateToCountryDetail(source: viewController!, destination: destinationVC)
    }
    
    func routeToRoumingPackageDetail() {
        let destinationVC = PackageDescriptionViewController()
        PackageDescriptionConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToRoumingPackageDetail(source: dataStore!, destination: &destinationDS)

        navigateToRoumingPackageDetail(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToCountryDetail(source: RoumingViewController, destination: RoumingCountryDetailViewController) {
        source.show(destination, sender: nil)
    }
    
    func navigateToRoumingPackageDetail(source: RoumingViewController, destination: PackageDescriptionViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data

    func passDataToCountryDetail(source: RoumingDataStore, destination: inout RoumingCountryDetailDataStore) {
        destination.country = source.countryName
    }
    
    func passDataToRoumingPackageDetail(source: RoumingDataStore, destination: inout PackageDescriptionDataStore) {
    }
}
