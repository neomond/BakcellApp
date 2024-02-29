//
//  PackageDescriptionInteractor.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

protocol PackageDescriptionBusinessLogic {
    
    func load(request: PackageDescription.Load.Request)
}

protocol PackageDescriptionDataStore {
    
    //var name: String { get set }
}

final class PackageDescriptionInteractor: PackageDescriptionBusinessLogic, PackageDescriptionDataStore {
    
    var presenter: PackageDescriptionPresentationLogic?
    lazy var worker: PackageDescriptionWorkingLogic = PackageDescriptionWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: PackageDescription.Load.Request) {
        let response = PackageDescription.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
