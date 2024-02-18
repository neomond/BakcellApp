//
//  RoumingPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingPresentationLogic {
    
    func presentLoad(response: Rouming.Load.Response)
}

final class RoumingPresenter: RoumingPresentationLogic {
    
    weak var viewController: RoumingDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Rouming.Load.Response) {
        let viewModel = Rouming.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
