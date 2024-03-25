//
//  RoumingCountryDetailViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit
import SnapKit

protocol RoumingCountryDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel)
}

final class RoumingCountryDetailViewController: UIViewController, ThemeableViewController {

    
    var theme: ThemeProvider = App.theme
    
    var mainView: RoumingCountryDetailView?
    var interactor: RoumingCountryDetailBusinessLogic?
    var router: (RoumingCountryDetailRoutingLogic & RoumingCountryDetailDataPassing)?
    
    var selectedFilterIndex = 0
    

    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
       
        self.view = mainView
        mainView?.delegate = self
        self.setupPageViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = router?.dataStore?.country
        self.load()
    }
    
    
    
    // MARK: - Public Methods
    
    func load() {
        let request = RoumingCountryDetail.Load.Request()
        interactor?.load(request: request)
    }
    
    
    
    private func setupPageViewController() {
        self.addChild(self.mainView!.pageViewController)
        self.mainView!.pageViewController.didMove(toParent: self)
    }
    
}

// MARK: - Display Logic

extension RoumingCountryDetailViewController: RoumingCountryDetailDisplayLogic {
    
    func displayLoad(viewModel: RoumingCountryDetail.Load.ViewModel) {
        mainView?.setupSegmentedControl(withTitles: viewModel.categories)
    }
}

// MARK: - View Delegate

extension RoumingCountryDetailViewController: RoumingCountryDetailViewDelegate {
}
