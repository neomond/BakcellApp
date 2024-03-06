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
    
    //var name: String { get set }
    var country: String { get set }
}

final class RoumingCountryDetailInteractor: RoumingCountryDetailBusinessLogic, RoumingCountryDetailDataStore {
    
    var country: String = ""
    
    var presenter: RoumingCountryDetailPresentationLogic?
    lazy var worker: RoumingCountryDetailWorkingLogic = RoumingCountryDetailWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: RoumingCountryDetail.Load.Request) {
        let response = RoumingCountryDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
