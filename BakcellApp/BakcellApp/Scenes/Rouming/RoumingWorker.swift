//
//  RoumingWorker.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellNetworkKit

protocol RoumingWorkingLogic {

    func fetchRoaming(completion: @escaping (RoumingPackagesResponse?) -> Void)
}

final class RoumingWorker: RoumingWorkingLogic {
    
    
    // MARK: - Private Properties
    
    private let service: ServiceProtocol = App.service
    
    
    // MARK: - Working Logic
    func fetchRoaming(completion: @escaping (RoumingPackagesResponse?) -> Void) {
        service.rouming.getRouming { result in
            switch result {
            case .success(let data):
                completion(data)
            default:
                completion(nil)
            }
        }
    }
    
}
