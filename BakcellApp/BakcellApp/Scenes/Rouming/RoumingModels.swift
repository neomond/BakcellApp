//
//  RoumingModels.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellNetworkKit

enum Rouming {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request { }
        
        struct Response { }
        
        struct ViewModel { }
    }
    
    enum FetchRouming {
        struct Request { }
        
        struct Response {
            let roumingResponse: RoumingPackagesResponse?
        }
        
        struct ViewModel {
            let roumingModel: RoumingPackagesModel
        }
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


enum PackageCellType {
    case internet
    case smsAndCall
}


struct CardCellModel {
    var title: String
    var freeText: String
    var priceText: String
    var isFree: Bool
    var dataUnit: String
    var showWhatsAppLogo: Bool
}



// all included
struct AllIncludedModel {
    let title: String
    let price: String
    let internetQuota: String
    let callQuota: String
    let smsQuota: String
}



let monthlyPackage = AllIncludedModel(
    title: "Aylıq hamısı daxil",
    price: "30.00 ₼ / Ay",
    internetQuota: "1000 MB",
    callQuota: "100 dəq.",
    smsQuota: "100"
)

let weeklyPackage = AllIncludedModel(
    title: "Həftəlik hamısı daxil",
    price: "20.00 ₼ / Həftə",
    internetQuota: "500 MB",
    callQuota: "50 dəq.",
    smsQuota: "50"
)

let dailyPackage = AllIncludedModel(
    title: "Gündəlik hamısı daxil",
    price: "5.00 ₼ / Gün",
    internetQuota: "100 MB",
    callQuota: "10 dəq.",
    smsQuota: "10"
)

let allIncludedPackages = [monthlyPackage, weeklyPackage, dailyPackage]
