//
//  Result.swift
//  BakcellNetworkKit
//
//  Created by Nazrin Atayeva on 11.03.24.
//

import Foundation

public enum Result<SuccessValue, WrongValue> {
    case successNoContent
    case success(SuccessValue)
    case wrong(WrongValue)
    case failure(Error)
}
