//
//  RoumingViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol RoumingDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Rouming.Load.ViewModel)
    
    func displayRoaming(viewModel: Rouming.FetchRouming.ViewModel)
    
}

final class RoumingViewController: UIViewController {

    var mainView: RoumingView?
    var interactor: RoumingBusinessLogic?
    var router: (RoumingRoutingLogic & RoumingDataPassing)?
    
    var internetPackages: [InternetPackagesItemModel] = []
    var smsPackages: [SMSCallPackagesItemModel] = []
    var allInclPackages: [AllPackagesItemModel] = []
    
    private lazy var travelHeaderView: TravelTableHeaderView = {
        let view = TravelTableHeaderView()
        view.delegate = self
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
    
    func loadRoaming() {
        self.mainView?.startLoading()
        let request = Rouming.FetchRouming.Request()
        interactor?.loadRoaming(request: request)
    }
    
}

// MARK: - Display Logic

extension RoumingViewController: RoumingDisplayLogic {
    
    func displayLoad(viewModel: Rouming.Load.ViewModel) {
        self.loadRoaming()
    }
    
    func displayRoaming(viewModel: Rouming.FetchRouming.ViewModel) {
        self.travelHeaderView.items = viewModel.roumingModel.countries
        self.internetPackages = viewModel.roumingModel.internetPackages.items
        self.smsPackages = viewModel.roumingModel.smsCallPackages.items
        self.allInclPackages = viewModel.roumingModel.allPackages.items
        
        self.mainView?.tableView.reloadData()
        self.mainView?.stopLoading()
    }
}

// MARK: - View Delegate

extension RoumingViewController: RoumingViewDelegate { }


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
            return self.allInclPackages.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionTitle = SectionTitle.allCases[indexPath.section]
        
        switch sectionTitle {
        case .travel:
            return UITableViewCell.init()

            
        case .internetPackages, .callAndSMSPackages:
            let cell = tableView.dequeueReusableCell(withIdentifier: "internetPackagesCell", for: indexPath) as! InternetPackagesCell
            cell.delegate = self
            if sectionTitle == .internetPackages {
                cell.cellType = .internet
                cell.internetPackages = self.internetPackages
            } else if sectionTitle == .callAndSMSPackages {
                cell.cellType = .smsAndCall
                cell.smsPackages = self.smsPackages
            }
          
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
            
        case .allIncludedPackages:
            let cell = tableView.dequeueReusableCell(withIdentifier: "allIncludedPackagesCell", for: indexPath) as! AllIncludedPackagesCell
            let model = self.allInclPackages[indexPath.row]
            cell.model = model
            
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



extension RoumingViewController: TravelTableHeaderViewDelegate {
    func onCountrySelected(selectedCountryName: String) {
        self.interactor?.getSelectedCountry(countryName: selectedCountryName)
        self.router?.routeToCountryDetail()
    }
}

extension RoumingViewController: InternetPackagesCellDelegate {
    func onPackageSelected() {
        router?.routeToRoumingPackageDetail()
    }
}

