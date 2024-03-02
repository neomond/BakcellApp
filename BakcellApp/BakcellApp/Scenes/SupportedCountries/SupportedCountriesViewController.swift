//
//  SupportedCountriesViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

protocol SupportedCountriesDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: SupportedCountries.Load.ViewModel)
}

final class SupportedCountriesViewController: UIViewController {
    
    var mainView: SupportedCountriesView?
    var interactor: SupportedCountriesBusinessLogic?
    var router: (SupportedCountriesRoutingLogic & SupportedCountriesDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.showBackButton = true
        self.title = "Dəstəklənən ölkələr"
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = SupportedCountries.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension SupportedCountriesViewController: SupportedCountriesDisplayLogic {
    
    func displayLoad(viewModel: SupportedCountries.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension SupportedCountriesViewController: SupportedCountriesViewDelegate {
    
}
