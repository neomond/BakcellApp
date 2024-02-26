//
//  RoumingPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingPresentationLogic {
    
    func presentLoad(response: Rouming.Load.Response)
    
    func presentRoamingCountries(response: Rouming.FetchRoamingCountries.Response)
}


final class RoumingPresenter: RoumingPresentationLogic {
    
    weak var viewController: RoumingDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Rouming.Load.Response) {
        let viewModel = Rouming.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    func presentRoamingCountries(response: Rouming.FetchRoamingCountries.Response) {
        guard let countries = response.countries else {
            return
        }
        let viewModel = Rouming.FetchRoamingCountries.ViewModel(countries: countries)
        viewController?.displayRoamingCountries(viewModel: viewModel)
    }
}
