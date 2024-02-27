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
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension RoamingDetailsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoumingTableViewCell.reuseIdentifier, for: indexPath) as? RoumingTableViewCell else {
           return UITableViewCell()
        }

        return cell
    }
}

// MARK: - UITableViewDelegate

extension RoamingDetailsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }
    
    
}

