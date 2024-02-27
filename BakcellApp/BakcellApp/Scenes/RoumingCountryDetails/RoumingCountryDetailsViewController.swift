//
//  RoumingCountryDetailsViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit

protocol RoumingCountryDetailsDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingCountryDetails.Load.ViewModel)
}

final class RoumingCountryDetailsViewController: UIViewController {
    
    var mainView: RoumingCountryDetailsView?
    var interactor: RoumingCountryDetailsBusinessLogic?
    var router: (RoumingCountryDetailsRoutingLogic & RoumingCountryDetailsDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = "Türkiyə"
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = RoumingCountryDetails.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension RoumingCountryDetailsViewController: RoumingCountryDetailsDisplayLogic {
    
    func displayLoad(viewModel: RoumingCountryDetails.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension RoumingCountryDetailsViewController: RoumingCountryDetailsViewDelegate {
    
}
