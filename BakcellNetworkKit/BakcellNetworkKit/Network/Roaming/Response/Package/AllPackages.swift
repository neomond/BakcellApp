//
//  AllPackages.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 13.03.24.
//

import Foundation



// MARK: - AllPackages
public struct AllPackagesResponse: Codable {
    public let title: String
    public let items: [AllPackagesItemResponse]
}

// MARK: - AllPackagesItem
public struct AllPackagesItemResponse: Codable {
    public let title, period: String
    public let types: [TypeElementResponse]
}

// MARK: - TypeElement
public struct TypeElementResponse: Codable {
    public let name, units: String
}
