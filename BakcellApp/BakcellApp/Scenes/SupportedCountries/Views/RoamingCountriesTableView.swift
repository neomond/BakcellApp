//
//  RoamingCountriesTableView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 11.03.24.
//

import UIKit

class RoamingCountriesTableView: UITableView {
    
    //MARK: Init
    
    init(){
        super.init(frame: .zero, style: .plain)
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.allowsSelection = false
        self.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
