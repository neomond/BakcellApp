//
//  AppAssets.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

public enum AppAssets: String, CaseIterable {
    
    case addIcon
    case map
    case search
    case whatsapp
    case back
    case internet
    case sms
    case phone
    case duration
    case price
    case flag
    case turkey
    case done
    case russia
    case georgia
    
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
