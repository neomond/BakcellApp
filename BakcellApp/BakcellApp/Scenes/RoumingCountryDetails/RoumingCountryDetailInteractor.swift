//
//  RoumingCountryDetailInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

protocol RoumingCountryDetailBusinessLogic {
    
    func load(request: RoumingCountryDetail.Load.Request)
}

protocol RoumingCountryDetailDataStore {
    
    var country: String { get set }
}

final class RoumingCountryDetailInteractor: RoumingCountryDetailBusinessLogic, RoumingCountryDetailDataStore {
    
    var country: String = ""
    
    var presenter: RoumingCountryDetailPresentationLogic?
    
    lazy var worker: RoumingCountryDetailWorkingLogic = RoumingCountryDetailWorker()
  
    
    // MARK: Business Logic
  
    func load(request: RoumingCountryDetail.Load.Request) {
        let categories = RoumingCountryDetail.categories
        let response = RoumingCountryDetail.Load.Response(categories: categories)
        presenter?.presentLoad(response: response)
    }
}
