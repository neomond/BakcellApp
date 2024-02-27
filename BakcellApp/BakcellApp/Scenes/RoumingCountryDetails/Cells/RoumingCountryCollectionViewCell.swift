//
//  RoumingCountryCollectionViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit
import SnapKit
import BakcellUIKit

final class RoumingCountryCollectionViewCell: UICollectionViewCell, ThemeableView {
   
    static  var reuseIdentifier = "RoumingCountryCollectionViewCell"
    
    var theme: ThemeProvider = App.theme
    
    private lazy var titleContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.textColor = adaptiveColor(.black)
        return label
    }()
    
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    
    private func updateAppearance() {
        let isSelected = self.isSelected
        titleContainerView.backgroundColor = isSelected ? adaptiveColor(.main) : adaptiveColor(.whitePrimary)
        titleLabel.textColor = isSelected ? adaptiveColor(.whitePrimary) : adaptiveColor(.black)
        titleContainerView.layer.borderWidth = isSelected ? 2 : 0
        titleContainerView.layer.borderColor = isSelected ? adaptiveColor(.main).cgColor : UIColor.clear.cgColor
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.updateConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        self.contentView.addSubview(titleContainerView)
        self.titleContainerView.addSubview(titleLabel)
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        titleContainerView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(8)
            
        }
        
        titleLabel.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

