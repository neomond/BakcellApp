//
//  RoumingCountryDetailsPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailsPresentationLogic {
    
    func presentLoad(response: RoumingCountryDetails.Load.Response)
}

final class RoumingCountryDetailsPresenter: RoumingCountryDetailsPresentationLogic {
    
    weak var viewController: RoumingCountryDetailsDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingCountryDetails.Load.Response) {
        let viewModel = RoumingCountryDetails.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
