//
//  RoumingWorker.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingWorkingLogic {
    func fetchRoamingCountries(completion: @escaping ([String]?) -> Void)
}

final class RoumingWorker: RoumingWorkingLogic {

    // MARK: - Private Properties
    
//    private let service: ServiceProtocol = App.service

    
    // MARK: - Working Logic
    func fetchRoamingCountries(completion: @escaping ([String]?) -> Void) {
        let countries = ["Turkiye", "Rusiya", "Almaniya", "Qazaxistan", "Cexiya", "Ispania", "Italiya"]
        completion(countries)
    }
    
}
