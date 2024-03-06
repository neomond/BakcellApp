//
//  OperatorsViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit

class OperatorsViewController: UIViewController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    private lazy var roamingSegmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl()
        segmentedControl.backgroundColor = adaptiveColor(.grayPrimary)
        segmentedControl.selectionBoxStyle = .default
        segmentedControl.selectionBoxColor = adaptiveColor(.whitePrimary)
        segmentedControl.selectionBoxCornerRadius = 10
        segmentedControl.layoutPolicy = .fixed
        segmentedControl.segmentSpacing = 0
        segmentedControl.selectionBoxHeight = 32
        segmentedControl.selectionHorizontalPadding = 8
        segmentedControl.contentInset = .zero
        segmentedControl.clipsToBounds = true
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    private lazy var backViewForRoamingSegmentedControl: UIView = {
        let view = UIView()

        return view
    }()
    
    private lazy var operatorsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.contentInset = .zero
        tableView.register(OperatorViewCell.self, forCellReuseIdentifier: OperatorViewCell.reuseIdentifier)

        
        return tableView
        
    }()
    
    private lazy var stackView: UIStackView  = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSegmentedControl()
        self.addSubviews()
    }
    
    private func addSubviews() {
        self.backViewForRoamingSegmentedControl.addSubview(self.roamingSegmentedControl)
       
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.backViewForRoamingSegmentedControl)
        self.stackView.addArrangedSubview(self.operatorsTableView)
       

        self.updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        self.backViewForRoamingSegmentedControl.snp.updateConstraints { make in
            make.height.equalTo(64)

        }
        
        self.roamingSegmentedControl.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    func setSegmentedControl() {
        let titleStrings = ["Öncədən ödənişli", "Fakturalı"]
        let titles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        
        let selectedTitles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.roamingSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
        
    }
}



//MARK: UITableView

extension OperatorsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OperatorViewCell.reuseIdentifier, for: indexPath) as?  OperatorViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension OperatorsViewController: SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
        
    }
}
