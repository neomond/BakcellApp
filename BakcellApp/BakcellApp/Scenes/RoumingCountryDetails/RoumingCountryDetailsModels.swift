//
//  RoumingCountryDetailsModels.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit

enum RoumingCountryDetails {
    
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


struct CallSection {
    var title: String
    var imageName: String
    var incomingCost: String
    var outgoingCost: String
}

struct SMSSection {
    var title: String
    var imageName: String
    var incomingCost: String
    var outgoingCost: String
}

struct InternetSection {
    var title: String
    var imageName: String
    var usageDetails: String
    var networkTypes: String
}

// entire cell
struct RoamingPackageModel {
    var packageName: String
    var callSection: CallSection
    var smsSection: SMSSection
    var internetSection: InternetSection
}


let roamingPackagesMockData: [RoamingPackageModel] = [
    RoamingPackageModel(
        packageName: "TT MobileB",
        callSection: CallSection(
            title: "Zənglər",
            imageName: "cellcall",
            incomingCost: "0.39 ₼/dəq",
            outgoingCost: "0.99 ₼/dəq"
        ),
        smsSection: SMSSection(
            title: "SMS",
            imageName: "smsicon",
            incomingCost: "Pulsuz",
            outgoingCost: "0.19 ₼/sms"
        ),
        internetSection: InternetSection(
            title: "İnternet",
            imageName: "interneticon",
            usageDetails: "-",
            networkTypes: "2G, 3G, 4G"
        )
    ),
    RoamingPackageModel(
        packageName: "Turkcell",
        callSection: CallSection(
            title: "Zənglər",
            imageName: "cellcall",
            incomingCost: "0.39 ₼/dəq",
            outgoingCost: "0.99 ₼/dəq"
        ),
        smsSection: SMSSection(
            title: "SMS",
            imageName: "smsicon",
            incomingCost: "Pulsuz",
            outgoingCost: "0.19 ₼/sms"
        ),
        internetSection: InternetSection(
            title: "İnternet",
            imageName: "interneticon",
            usageDetails: "-",
            networkTypes: "2G, 3G, 4G"
        )
    ),
]
