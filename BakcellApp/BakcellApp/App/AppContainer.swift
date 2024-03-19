//
//  AppContainer.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import Foundation
import BakcellUIKit
import BakcellNetworkKit


let App = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    
    let service = Service()

    let theme = AppTheme()
}
