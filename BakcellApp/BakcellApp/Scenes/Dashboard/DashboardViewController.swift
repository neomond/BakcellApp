//
//  DashboardViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol DashboardDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Dashboard.Load.ViewModel)
}

final class DashboardViewController: UIViewController {
    
    var mainView: DashboardView?
    var interactor: DashboardBusinessLogic?
    var router: (DashboardRoutingLogic & DashboardDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = Dashboard.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension DashboardViewController: DashboardDisplayLogic {
    
    func displayLoad(viewModel: Dashboard.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension DashboardViewController: DashboardViewDelegate {
    
}
