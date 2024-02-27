//
//  RoumingCountryDetailsInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailsBusinessLogic {
    
    func load(request: RoumingCountryDetails.Load.Request)
}

protocol RoumingCountryDetailsDataStore {
    
    //var name: String { get set }
}

final class RoumingCountryDetailsInteractor: RoumingCountryDetailsBusinessLogic, RoumingCountryDetailsDataStore {
    
    var presenter: RoumingCountryDetailsPresentationLogic?
    lazy var worker: RoumingCountryDetailsWorkingLogic = RoumingCountryDetailsWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingCountryDetails.Load.Request) {
        let response = RoumingCountryDetails.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
