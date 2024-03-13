//
//  PackageDescriptionViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

protocol PackageDescriptionDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: PackageDescription.Load.ViewModel)
}

final class PackageDescriptionViewController: UIViewController {
    
    var mainView: PackageDescriptionView?
    var interactor: PackageDescriptionBusinessLogic?
    var router: (PackageDescriptionRoutingLogic & PackageDescriptionDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showBackButton = true
        self.title = "Paketin təsviri"
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = PackageDescription.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension PackageDescriptionViewController: PackageDescriptionDisplayLogic {
    
    func displayLoad(viewModel: PackageDescription.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension PackageDescriptionViewController: PackageDescriptionViewDelegate {
    func onCheckCountryBtnTapped() {
        router?.routeToSupportedCountries()
    }
}


