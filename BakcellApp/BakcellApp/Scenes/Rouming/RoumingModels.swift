//
//  RoumingModels.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

enum Rouming {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request { }
        
        struct Response { }
        
        struct ViewModel { }
    }
}


enum SectionTitle: String, CaseIterable {
    case travel = "Hara səyahət etmək istəyirsiniz?"
    case internetPackages = "İnternet paketləri"
    case allIncludedPackages = "Hamısı daxil paketləri"
    case callAndSMSPackages = "SMS və zəng paketləri"
    
    var displayValue: String {
        return self.rawValue
    }
}
