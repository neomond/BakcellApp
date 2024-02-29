//
//  PackageDescriptionPresenter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

protocol PackageDescriptionPresentationLogic {
    
    func presentLoad(response: PackageDescription.Load.Response)
}

final class PackageDescriptionPresenter: PackageDescriptionPresentationLogic {
    
    weak var viewController: PackageDescriptionDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: PackageDescription.Load.Response) {
        let viewModel = PackageDescription.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
