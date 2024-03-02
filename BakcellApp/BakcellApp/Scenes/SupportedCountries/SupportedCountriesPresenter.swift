//
//  SupportedCountriesPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

protocol SupportedCountriesPresentationLogic {
    
    func presentLoad(response: SupportedCountries.Load.Response)
}

final class SupportedCountriesPresenter: SupportedCountriesPresentationLogic {
    
    weak var viewController: SupportedCountriesDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: SupportedCountries.Load.Response) {
        let viewModel = SupportedCountries.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
