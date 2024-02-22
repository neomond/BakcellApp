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
        case .internetPackages, .callAndSMSPackages:
            return 1
        case .allIncludedPackages:
            return 3
        default:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionTitle = SectionTitle.allCases[indexPath.section]
        
        switch sectionTitle {
        case .travel:
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.reuseIdentifier, for: indexPath) as! TravelTableViewCell
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
            
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
        //        default:
        //
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //            if indexPath.row == 0 {
        //
        //            } else if indexPath.row == 1 {
        //
        //            } else if indexPath.row == 2 {
        //
        //            }
        //            cell.backgroundColor = .clear
        //            cell.selectionStyle = .none
        //            return cell
        //        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionTitle.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        }
        
        let allTitles = SectionTitle.allCases.map { $0.displayValue }
        
        guard section < allTitles.count else { return nil }
        
        let title = allTitles[section]
        
        return SectionHeaderView(title: title, theme: theme)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
                return CGFloat.leastNormalMagnitude
            }
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let sectionTitle = SectionTitle.allCases[indexPath.section]
        switch sectionTitle {            
        case .internetPackages:
            return 190
            
        case .allIncludedPackages:
            return 160
            
        case .callAndSMSPackages:
            return 150
            
            
        default:
            return UITableView.automaticDimension
        }
    }
}



