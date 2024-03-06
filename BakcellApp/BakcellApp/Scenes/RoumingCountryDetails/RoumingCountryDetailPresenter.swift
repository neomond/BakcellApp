//
//  RoumingCountryDetailPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

protocol RoumingCountryDetailPresentationLogic {
    
    func presentLoad(response: RoumingCountryDetail.Load.Response)
}

final class RoumingCountryDetailPresenter: RoumingCountryDetailPresentationLogic {
    
    weak var viewController: RoumingCountryDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: RoumingCountryDetail.Load.Response) {
        let viewModel = RoumingCountryDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
