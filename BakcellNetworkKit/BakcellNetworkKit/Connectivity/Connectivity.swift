//
//  Connectivity.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 11.03.24.
//

import Foundation
import Alamofire

public final class Connectivity {
    public class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
