//
//  RoumingAPI.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 18.03.24.
//


import Foundation
import Moya

public enum RoumingAPI {
    case rouming
}

extension RoumingAPI: TargetType {
    
    public var sampleData: Data {
        return Data()
    }
    
    
    public var headers: [String : String]? {
        let dict = ["Content-Type": "application/json"]
        return dict
    }
    
    
    public var baseURL: URL {
        switch self {
    //-------------------------------------
    // MARK: need to be a main rouming packages data endpoint
        case .rouming:
            return URL(string: "https://demo9468773.mockable.io/bakcell")!
        }
    }
    //-------------------------------------
    
    
    public var path: String {
        switch self {
        case .rouming:
            return "/rouming"
        }
    }
    
    
    public var method: Moya.Method {
        switch self {
        case .rouming:
            return .get
        }
    }
    
    
    public var task: Task {
        switch self {
        case .rouming:
            return .requestPlain
        }
    }
    
    
    public var validate: Bool {
        return true
    }
    
    
    public var validationType: ValidationType {
        return .customCodes([200, 201, 202, 204, 304, 400, 401, 403, 404, 406, 409])
    }
}
