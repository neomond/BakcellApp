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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(InternetPackagesCell.self, forCellReuseIdentifier: "internetPackagesCell")
        tableView.register(AllIncludedPackagesCell.self, forCellReuseIdentifier: "allIncludedPackagesCell")
        tableView.register(TravelTableViewCell.self, forCellReuseIdentifier: "TravelTableViewCell")

        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(tableView)
        self.addSubviews()
        self.addConstraints()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        
        self.updateConstraints()
    }
    
    private func addConstraints() {
        tableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
    
}


