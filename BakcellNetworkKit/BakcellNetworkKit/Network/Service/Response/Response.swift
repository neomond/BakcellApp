//
//  Response.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 11.03.24.
//

import Foundation

public struct ApiResponse: Decodable {
    public var code: String?
    public var message: String?
}

public struct NoResponse: Decodable {}

public struct WrongResponse: Decodable {
    public var code: String?
    public var message: String?
}
