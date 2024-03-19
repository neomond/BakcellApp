//
//  SmsCallPackages.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 13.03.24.
//

import Foundation

// MARK: - SMSCallPackages
public struct SMSCallPackagesResponse: Codable {
    public let title: String
    public let items: [SMSCallPackagesItemResponse]
}

// MARK: - SMSCallPackagesItem
public struct SMSCallPackagesItemResponse: Codable {
    public let id: Int
    public let title, period, type: String
}
