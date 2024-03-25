//
//  RoumingView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellUIKit
import SnapKit

protocol RoumingViewDelegate: AnyObject { }

final class RoumingView: UIView, ThemeableView {
    
    weak var delegate: RoumingViewDelegate?
    
    var theme: ThemeProvider = App.theme
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(InternetPackagesCell.self, forCellReuseIdentifier: "internetPackagesCell")
        tableView.register(AllIncludedPackagesCell.self, forCellReuseIdentifier: "allIncludedPackagesCell")
        return tableView
    }()
    
    private lazy var loadingIndicator: LoadingActivityIndicator = {
        let indicator = LoadingActivityIndicator()
        return indicator
    }()
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        
        self.addSubview(self.tableView)
        self.addSubview(self.loadingIndicator)
        self.setupUI()
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.tableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        self.loadingIndicator.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
    
//    MARK: Loading indicator
    
    public func startLoading() {
        self.loadingIndicator.startLoading()
    }
    
    public func stopLoading() {
        self.loadingIndicator.stopLoading {
            self.tableView.isHidden = false
            self.loadingIndicator.removeFromSuperview()
        }
        
    }
    
}


