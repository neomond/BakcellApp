//
//  RoumingResponse.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 18.03.24.
//

import Foundation

// MARK: - Welcome
public struct RoumingPackagesResponse: Codable {
    public let title: String
    public let countries: [String: String]
    public let internetPackages: InternetPackagesResponse
    public let allPackages: AllPackagesResponse
    public let smsCallPackages: SMSCallPackagesResponse
}

