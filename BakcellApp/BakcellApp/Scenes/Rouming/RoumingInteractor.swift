//
//  RoumingInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingBusinessLogic {
    
    func load(request: Rouming.Load.Request)
    
    func loadRoaming(request: Rouming.FetchRouming.Request)
    
    func getSelectedCountry(countryName: String)
}

protocol RoumingDataStore {
    
    var countryName: String { get set }
    //var name: String { get set }
}

final class RoumingInteractor: RoumingBusinessLogic, RoumingDataStore {
    var countryName = ""
    
    
    var presenter: RoumingPresentationLogic?
    lazy var worker: RoumingWorkingLogic = RoumingWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: Rouming.Load.Request) {
        let response = Rouming.Load.Response()
        presenter?.presentLoad(response: response)
    }
    
    func loadRoaming(request: Rouming.FetchRouming.Request) {
        worker.fetchRoaming { [weak self] data in
            guard let self = self else {
                return
            }
            let response = Rouming.FetchRouming.Response(roumingResponse: data)
            self.presenter?.presentRoaming(response: response)
        }
      
    }
    func getSelectedCountry(countryName: String) {
        self.countryName = countryName
    }
}
