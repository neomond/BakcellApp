//
//  RoumingInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingBusinessLogic {
    
    func load(request: Rouming.Load.Request)
}

protocol RoumingDataStore {
    
    //var name: String { get set }
}

final class RoumingInteractor: RoumingBusinessLogic, RoumingDataStore {
    
    var presenter: RoumingPresentationLogic?
    lazy var worker: RoumingWorkingLogic = RoumingWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: Rouming.Load.Request) {
        let response = Rouming.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
