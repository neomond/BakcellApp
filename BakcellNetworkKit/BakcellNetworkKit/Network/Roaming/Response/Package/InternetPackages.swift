//
//  InternetPackages.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 13.03.24.
//

import Foundation


// MARK: - InternetPackages
public struct InternetPackagesResponse: Codable {
    public let title: String
    public let items: [InternetPackagesItemResponse]
}

// MARK: - InternetPackagesItem
public struct InternetPackagesItemResponse: Codable {
    public let id: Int
    public let title, icon, desc, period: String
    public let type: String
}
