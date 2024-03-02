//
//  SupportedCountriesView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

protocol SupportedCountriesViewDelegate: AnyObject {
    
}

final class SupportedCountriesView: UIView, UITableViewDataSource {
    
    weak var delegate: SupportedCountriesViewDelegate?
    
    private var countries: [CountryInfo] = [
        CountryInfo(name: "Türkiya", providers: "Vodafone, Türkcell, Türkcel", flagImage: UIImage(named: "turkey")!, isSupported: true),
        CountryInfo(name: "Rusiya", providers: "Vodafone, MTC, Beeline", flagImage: UIImage(named: "russia")!, isSupported: true),
        CountryInfo(name: "Türkiya", providers: "Vodafone, Türkcell, Türkcel", flagImage: UIImage(named: "turkey")!, isSupported: true),
        CountryInfo(name: "Rusiya", providers: "Vodafone, MTC, Beeline", flagImage: UIImage(named: "russia")!, isSupported: true)
        
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier, for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        
        let country = countries[indexPath.row]
        cell.configure(with: country.name, providers: country.providers, flag: country.flagImage, isSupported: country.isSupported)
        return cell
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
        self.addSubview(tableView)
     
    }
    
    private func addConstraints(){
        self.tableView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.bottom.equalToSuperview()
        }

    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
