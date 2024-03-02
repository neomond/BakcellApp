//
//  SupportedCountriesModels.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

enum SupportedCountries {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
}


struct CountryInfo {
    let name: String
    let providers: String
    let flagImage: UIImage
    let isSupported: Bool
}
