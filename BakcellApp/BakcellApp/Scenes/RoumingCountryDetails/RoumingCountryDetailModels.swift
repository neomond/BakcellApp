//
//  RoumingCountryDetailModels.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

enum RoumingCountryDetail {
    
    static var categories: [String] {
        PageCategoryModel.allCases.map { $0.rawValue }
    }
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
            let categories: [String]
        }
        
        struct ViewModel {
            let categories: [String]
        }
    }
}



enum PageCategoryModel: String, CaseIterable {
//    case packages = "Paketlər"
    case operators = "Operatorlar"
    case priceComparison = "Qiymət müqayisəsi"
    
}

struct RoumingOperatorServices {
    let services: [RoumingOperatorServiceType]
}

struct RoumingOperatorServiceType {
    let packageType: PackageType
    let volumes: [RoumingOperatorVolume]
}

enum PackageType {
    case sms
    case internet
    case call
    
    var title: String {
        switch self {
        case .sms:
            return "SMS"
        case .internet:
            return "Internet"
        case .call:
            return "Zənglər"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .sms:
            return UIImage(named: AppAssets.sms.rawValue)
        case .internet:
            return UIImage(named: AppAssets.internet.rawValue)
        case .call:
            return UIImage(named: AppAssets.phone.rawValue)
        }
    }
}


struct RoumingOperatorVolume {
    let title: String
    let volume: String
    let volumeType: String
}
