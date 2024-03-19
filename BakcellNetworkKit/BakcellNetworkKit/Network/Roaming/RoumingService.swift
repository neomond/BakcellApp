//
//  RoumingService.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 18.03.24.
//

import Foundation
import Moya

public protocol RoumingServiceProtocol: BaseServiceProtocol {
    
    func getRouming(completion: @escaping (Result<RoumingPackagesResponse, WrongResponse>) -> ())
}


public class RoumingService: BaseService, RoumingServiceProtocol {
    
    private var provider: MoyaProvider<RoumingAPI>!
    
    override init() {
        super.init()
        
        #if DEBUG
        self.provider = MoyaProvider<RoumingAPI>()
        #else
        self.provider = MoyaProvider<LoyaltyAPI>(plugins: [self.authPlugin, self.languagePlugin])
        #endif
    }
    
   
    public func getRouming(completion: @escaping (Result<RoumingPackagesResponse, WrongResponse>) -> ()) {
        self.request(provider, target: .rouming) { result in
            completion(result)
        }
    }
}
