//
//  Colors.swift
//  BakcellUIKit
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

public enum ColorStyle: String, CaseIterable {
    
    // MARK: - Black
    
    case main           = "Main"
    case black          = "Black"
    case secondColor    = "SecondColor"
    case whitePrimary   = "WhitePrimary"
    case grayPrimary    = "GrayPrimary"
    case grayInput      = "GrayInput"
    case grayText       = "GrayText"
}

extension ColorStyle {
    
    func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}
