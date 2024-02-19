//
//  RoumingTableViewExtension.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

extension RoumingView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = SectionTitle.allCases[section]
        switch sectionTitle {
        case .internetPackages:
            return 1
        default:
            return 5
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionTitle = SectionTitle.allCases[indexPath.section]
        
        switch sectionTitle {
        case .internetPackages:
            let cell = tableView.dequeueReusableCell(withIdentifier: "internetPackagesCell", for: indexPath) as! InternetPackagesCell
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionTitle.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let allTitles = SectionTitle.allCases.map { $0.displayValue }
        
        guard section < allTitles.count else { return nil }
        
        let title = allTitles[section]
        
        return SectionHeaderView(title: title, theme: theme)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let sectionTitle = SectionTitle.allCases[indexPath.section]
        switch sectionTitle {
        case .internetPackages:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
}
