//
//  PackageDescriptionDetailView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//

import UIKit

class PackageDescriptionDetailView: UIView {
    
    lazy var aboutView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    
    lazy var aboutTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ətraflı məlumat"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    
    init(detailTexts: [String]) {
        super.init(frame: .zero)
        setupUI(detailTexts: detailTexts)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(detailTexts: [String]) {
        addSubview(aboutView)
        aboutView.addArrangedSubview(aboutTitleLabel)
        
        for text in detailTexts {
            let detailLabel = UILabel()
            detailLabel.setBulletText([text], font: UIFont.systemFont(ofSize: 15), bulletColor: .black, textColor: .black)
            aboutView.addArrangedSubview(detailLabel)
        }
    }
}
