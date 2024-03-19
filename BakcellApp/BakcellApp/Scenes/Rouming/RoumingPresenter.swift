//
//  RoumingPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingPresentationLogic {
    
    func presentLoad(response: Rouming.Load.Response)
    
    func presentRoaming(response: Rouming.FetchRouming.Response)
}


final class RoumingPresenter: RoumingPresentationLogic {
    
    weak var viewController: RoumingDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Rouming.Load.Response) {
        let viewModel = Rouming.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
    
    func presentRoaming(response: Rouming.FetchRouming.Response) {
       
        guard let response = response.roumingResponse else { return }
        let viewModel = Rouming.FetchRouming.ViewModel(roumingModel: response.convertToModel())
        viewController?.displayRoaming(viewModel: viewModel)
    }
}
