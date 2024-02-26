//
//  DestinationCollectionViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 21.02.24.
//

import UIKit
import BakcellUIKit

class DestinationCollectionViewCell: UICollectionViewCell, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    static var reuseIdentifier = "DestinationCollectionViewCell"
    
    var data: String? {
        didSet {
            configure()
        }
    }
    
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 2
        view.layer.borderColor = adaptiveColor(.grayInput).cgColor
        return view
    }()
    
    
    private lazy var destinationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = adaptiveColor(.grayText)
        label.layer.masksToBounds = true
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backView.addSubview(self.destinationLabel)
       
        self.contentView.addSubview(self.backView)
       
        self.updateConstraints()
    }
    
   
    override func updateConstraints() {
        super.updateConstraints()
        
        backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        destinationLabel.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().priority(.high)
            make.height.equalTo(40)
        }
        
    }
    
    
    func configure() {
        guard let data = data else {
            return
        }
        
        destinationLabel.text = data
        self.contentView.layoutIfNeeded()
    }
}
