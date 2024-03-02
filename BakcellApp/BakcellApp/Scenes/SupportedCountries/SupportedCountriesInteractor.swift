//
//  SupportedCountriesInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

protocol SupportedCountriesBusinessLogic {
    
    func load(request: SupportedCountries.Load.Request)
}

protocol SupportedCountriesDataStore {
    
    //var name: String { get set }
}

final class SupportedCountriesInteractor: SupportedCountriesBusinessLogic, SupportedCountriesDataStore {
    
    var presenter: SupportedCountriesPresentationLogic?
    lazy var worker: SupportedCountriesWorkingLogic = SupportedCountriesWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: SupportedCountries.Load.Request) {
        let response = SupportedCountries.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
