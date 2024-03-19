//
//  Service.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 11.03.24.
//

import Foundation
import Moya

public protocol ServiceDelegate: AnyObject {
    
}

public protocol ServiceDataSource: AnyObject {

}

public protocol ServiceProtocol {
    
    var delegate: ServiceDelegate? { get set }
    var dataSource: ServiceDataSource? { get set }
    
    var rouming: RoumingServiceProtocol { get }
    
    func cancelAll()
}

public class Service: ServiceProtocol {
    
    public enum Error: Swift.Error {
        case networkError
        case unauthorizedError
        case serializationError(internal: Swift.Error)
    }
    
    public weak var delegate: ServiceDelegate? {
        didSet {
            self.rouming.delegate = self
        }
    }
    
    public weak var dataSource: ServiceDataSource? {
        didSet {
            self.rouming.dataSource = self
        }
    }
    
    public var rouming: RoumingServiceProtocol = RoumingService()
    
    public init() { }
    
    public func cancelAll() {
        self.rouming.cancelAll()
    }
}

// MARK: - BaseService Delegate and DataSource

extension Service: BaseServiceDelegate, BaseServiceDataSource { }
