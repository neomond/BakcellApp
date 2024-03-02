//
//  RoamingDetailsTableView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 27.02.24.
//

import UIKit
import SnapKit

protocol RoamingDetailsTableViewDelegate: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
}

class RoamingDetailsTableView: UIView {
    
    weak var delegate: RoamingDetailsTableViewDelegate?
    
    private let roamingSegmentedControl: RoamingSegmentedControl = {
           let control = RoamingSegmentedControl(titles: ["Öncədən ödənişli", "Fakturalı"])
           return control
       }()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RoumingTableViewCell.self, forCellReuseIdentifier: RoumingTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupTableView() {
        self.addSubview(tableView)
        setupTableHeaderView()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func setupTableHeaderView() {
           roamingSegmentedControl.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 32)
           tableView.tableHeaderView = roamingSegmentedControl
       }
}

// MARK: - UITableViewDataSource

extension RoamingDetailsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roamingPackagesMockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoumingTableViewCell.reuseIdentifier, for: indexPath) as? RoumingTableViewCell else {
           return UITableViewCell()
        }
        
        let package = roamingPackagesMockData[indexPath.row]
           cell.configure(with: package)
           
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RoamingDetailsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }
}

