//
//  Countries.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 13.03.24.
//

import Foundation

public struct CountriesResponse: Codable {
    public let id: String
    public let countries: [String: String]
}
