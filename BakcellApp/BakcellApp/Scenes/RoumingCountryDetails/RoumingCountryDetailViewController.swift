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
        self.setSegmentedControl()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.title = router?.dataStore?.country
        self.load()
    }
    
    func setSegmentedControl() {
        let titleStrings = RoumingCountryDetail.categories
        let titles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        
        let selectedTitles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.whitePrimary)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.mainView?.filterSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
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
    }
}

// MARK: - View Delegate

extension RoumingCountryDetailViewController: RoumingCountryDetailViewDelegate {
}
