//
//  RoumingViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Rouming.Load.ViewModel)
}

final class RoumingViewController: UIViewController {
    
    var mainView: RoumingView?
    var interactor: RoumingBusinessLogic?
    var router: (RoumingRoutingLogic & RoumingDataPassing)?
    
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
        
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showBackButton = true
        self.title = "Rominq"
        self.load()
    }
    
    
    // MARK: - Public Methods
    
    func load() {
        let request = Rouming.Load.Request()
        interactor?.load(request: request)
    }
    
}

// MARK: - Display Logic

extension RoumingViewController: RoumingDisplayLogic {
    
    func displayLoad(viewModel: Rouming.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension RoumingViewController: RoumingViewDelegate {
    
}
