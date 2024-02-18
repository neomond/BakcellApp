//
//  DashboardInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol DashboardBusinessLogic {
    
    func load(request: Dashboard.Load.Request)
}

protocol DashboardDataStore {
    
    //var name: String { get set }
}

final class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore {
    
    var presenter: DashboardPresentationLogic?
    lazy var worker: DashboardWorkingLogic = DashboardWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: Dashboard.Load.Request) {
        let response = Dashboard.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
