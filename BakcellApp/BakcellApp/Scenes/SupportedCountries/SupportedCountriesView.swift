//
//  SupportedCountriesView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit

protocol SupportedCountriesViewDelegate: AnyObject { }

final class SupportedCountriesView: UIView, UITableViewDataSource {
    
    weak var delegate: SupportedCountriesViewDelegate?
    
    private var countries: [CountryInfo] = [
        CountryInfo(name: "Türkiya", providers: "Vodafone, Türkcell, Türkcel", flagImage: UIImage(named: "turkiye")!, isSupported: true),
        CountryInfo(name: "Rusiya", providers: "Vodafone, MTC, Beeline", flagImage: UIImage(named: "rusiya")!, isSupported: true),
        CountryInfo(name: "Türkiya", providers: "Vodafone, Türkcell, Türkcel", flagImage: UIImage(named: "turkiye")!, isSupported: true),
        CountryInfo(name: "Rusiya", providers: "Vodafone, MTC, Beeline", flagImage: UIImage(named: "rusiya")!, isSupported: true)
    ]
    
    lazy var countriesTableView: RoamingCountriesTableView = {
        let tableView = RoamingCountriesTableView()
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
        self.addSubview(countriesTableView)
     
    }
    
    private func addConstraints(){
        self.countriesTableView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
