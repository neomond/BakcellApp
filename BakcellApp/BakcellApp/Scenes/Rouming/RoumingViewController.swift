//
//  RoumingViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Rouming.Load.ViewModel)
    
    func displayRoamingCountries(viewModel: Rouming.FetchRoamingCountries.ViewModel)
}

final class RoumingViewController: UIViewController {
    
    var mainView: RoumingView?
    var interactor: RoumingBusinessLogic?
    var router: (RoumingRoutingLogic & RoumingDataPassing)?
    
    
    private lazy var travelHeaderView: TravelTableHeaderView = {
        let view = TravelTableHeaderView()
        return view
    }()
    
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
        self.mainView?.tableView.delegate = self
        self.mainView?.tableView.dataSource = self
        self.load()
    }
    
    
    // MARK: - Public Methods
    
    func load() {
        let request = Rouming.Load.Request()
        interactor?.load(request: request)
    }
    
    func loadRoamingCountries() {
        let request = Rouming.FetchRoamingCountries.Request()
        interactor?.loadRoamingCountries(request: request)
    }
    
}

// MARK: - Display Logic

extension RoumingViewController: RoumingDisplayLogic {
    
    func displayLoad(viewModel: Rouming.Load.ViewModel) {
        self.loadRoamingCountries()
    }
    
    func displayRoamingCountries(viewModel: Rouming.FetchRoamingCountries.ViewModel) {
        self.travelHeaderView.items = viewModel.countries
        self.mainView?.tableView.reloadData()
    }
}

// MARK: - View Delegate

extension RoumingViewController: RoumingViewDelegate {
    
}


//MARK: UITableView

extension RoumingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = SectionTitle.allCases[section]
        switch sectionTitle {
        case .travel:
            return 0
        case .internetPackages, .callAndSMSPackages:
            return 1
        case .allIncludedPackages:
            return 3
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionTitle = SectionTitle.allCases[indexPath.section]
        
        switch sectionTitle {
        case .travel:
            return UITableViewCell.init()

            
        case .internetPackages, .callAndSMSPackages:
            let cell = tableView.dequeueReusableCell(withIdentifier: "internetPackagesCell", for: indexPath) as! InternetPackagesCell
            
            if sectionTitle == .internetPackages {
                cell.cellType = .internet
            } else if sectionTitle == .callAndSMSPackages {
                cell.cellType = .smsAndCall
            }
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
            
        case .allIncludedPackages:
            let cell = tableView.dequeueReusableCell(withIdentifier: "allIncludedPackagesCell", for: indexPath) as! AllIncludedPackagesCell
            
            //            let packageModel = allIncludedPackages[indexPath.row]
            //             cell.configure(with: packageModel)
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionTitle.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if section == 0 {
            return travelHeaderView
        }
        else {
            let allTitles = SectionTitle.allCases.map { $0.displayValue }
            let title = allTitles[section]
            
            return SectionHeaderView(title: title)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
}



