//
//  RoumingModel.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.03.24.
//

import Foundation
import BakcellNetworkKit

struct RoumingPackagesModel {
    let title: String
    let countries: [String: String]
    let internetPackages: InternetPackagesModel
    let allPackages: AllPackagesModel
    let smsCallPackages: SMSCallPackagesModel
}
// MARK: - AllPackagesModel
struct AllPackagesModel {
    let title: String
    let items: [AllPackagesItemModel]
}

// MARK: - AllPackagesItemModel
struct AllPackagesItemModel{
    let title, period: String
    let types: [TypeElementModel]
}

// MARK: - TypeElementModel
struct TypeElementModel {
    let name, units: String
}


//MARK: InternetPackagesModel
struct InternetPackagesModel {
    let title: String
    let items: [InternetPackagesItemModel]
}

//MARK: InternetPackagesItemModel
class InternetPackagesItemModel: BasePackagesItemModel {
    let desc: String
    let icon: String
    
    init(id: Int, title: String, period: String, type: String, desc: String, icon: String) {
        self.desc = desc
        self.icon = icon
        super.init(id: id, title: title, period: period, type: type)
       
    }
}

//MARK: SMSCallPackagesModel
struct SMSCallPackagesModel {
    let title: String
    let items: [SMSCallPackagesItemModel]
}

// MARK: SMSCallPackagesItemModel
class SMSCallPackagesItemModel: BasePackagesItemModel {

}

class BasePackagesItemModel {
    let id: Int
    let title: String
    let period: String
    let type: String
    
    init(id: Int, title: String, period: String, type: String) {
        self.id = id
        self.title = title
        self.period = period
        self.type = type
    }
}

extension RoumingPackagesResponse {
    func convertToModel() -> RoumingPackagesModel {
        let allPackagesModel = AllPackagesModel(title: allPackages.title, items: allPackages.items.map { item in
            AllPackagesItemModel(title: item.title, period: item.period, types: item.types.map { type in
                TypeElementModel(name: type.name, units: type.units)
            })
        })
        
        let internetPackagesModel = InternetPackagesModel(title: internetPackages.title, items: internetPackages.items.map { item in
            InternetPackagesItemModel(id: item.id, title: item.title, period: item.period, type: item.type, desc: item.desc, icon: item.icon)
        })
        
        let smsCallPackagesModel = SMSCallPackagesModel(title: smsCallPackages.title, items: smsCallPackages.items.map { item in
            SMSCallPackagesItemModel(id: item.id, title: item.title, period: item.period, type: item.type)
        })
        
        return RoumingPackagesModel(title: title, countries: countries, internetPackages: internetPackagesModel, allPackages: allPackagesModel, smsCallPackages: smsCallPackagesModel)
    }
}
