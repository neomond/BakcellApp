//
//  RoumingCountryDetailsView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingCountryDetailsViewDelegate: AnyObject { }

final class RoumingCountryDetailsView: UIView, ThemeableView {
    
    weak var delegate: RoumingCountryDetailsViewDelegate?
    
    var theme: ThemeProvider = App.theme
    
    
    private let roumingCountryCollectionView = RoumingCountryCollectionView()
    
   
    
    private let roamingSegmentedControl: RoamingSegmentedControl = {
        let control = RoamingSegmentedControl(titles: ["Öncədən ödənişli", "Fakturalı"])
        return control
    }()
    
    
    private lazy var roamingDetailsTableView: RoamingDetailsTableView = {
        let view = RoamingDetailsTableView()
        return view
      }()
      
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        self.setupConstraints()
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
        self.addSubview(roumingCountryCollectionView)
        self.addSubview(roamingSegmentedControl)
        self.addSubview(roamingDetailsTableView)
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
    
    private func setupConstraints() {
        roumingCountryCollectionView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(54)
        }
        roamingSegmentedControl.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(roumingCountryCollectionView.snp.bottom).offset(24)
            make.height.equalTo(32)
        }
        roamingDetailsTableView.snp.updateConstraints { make in
            make.top.equalTo(roamingSegmentedControl.snp.bottom).offset(24)
            make.leading.bottom.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}

