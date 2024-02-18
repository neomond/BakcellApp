//
//  DashboardPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol DashboardPresentationLogic {
    
    func presentLoad(response: Dashboard.Load.Response)
}

final class DashboardPresenter: DashboardPresentationLogic {
    
    weak var viewController: DashboardDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Dashboard.Load.Response) {
        let viewModel = Dashboard.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
