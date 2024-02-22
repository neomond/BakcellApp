//
//  DestinationCollectionViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 21.02.24.
//

import UIKit

class DestinationCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier = "DestinationCollectionViewCell"
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    
    private lazy var destinationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .red
       
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
       
        super.updateConstraints()
    }
    
   
    override func updateConstraints() {
        super.updateConstraints()
        
        backView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        destinationLabel.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(11)
        }
        
    }
    
    
    public func configure(with destination: String) {
        destinationLabel.text = destination
    }
}
