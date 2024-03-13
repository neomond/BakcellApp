//
//  CountryTableViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 01.03.24.
//

import UIKit
import SnapKit
import BakcellUIKit

class CountryTableViewCell: UITableViewCell, ThemeableView {
    
    static let identifier = "CountryTableViewCell"
    
    var theme: ThemeProvider = App.theme
    
    private lazy var countryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .top
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var networkProvidersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppAssets.done.rawValue)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
        labelsStackView.addArrangedSubview(countryNameLabel)
        labelsStackView.addArrangedSubview(networkProvidersLabel)
        
        countryStackView.addArrangedSubview(countryFlagImageView)
        countryStackView.addArrangedSubview(labelsStackView)
        countryStackView.addArrangedSubview(checkmarkImageView)
        
        contentView.addSubview(countryStackView)
  
        countryStackView.layer.borderWidth = 1.0
        countryStackView.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        countryStackView.layer.cornerRadius = 24
        countryStackView.clipsToBounds = true
        
        
        countryStackView.isLayoutMarginsRelativeArrangement = true
        countryStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    
    private func setupConstraints() {
        countryStackView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(8)
        }
        
        countryFlagImageView.snp.updateConstraints { make in
            make.width.equalTo(28)
            make.height.equalTo(20)
        }
        
        checkmarkImageView.snp.updateConstraints { make in
            make.width.height.equalTo(20)
        }
    }
    
    func configure(with country: String, providers: String, flag: UIImage, isSupported: Bool) {
        countryNameLabel.text = country
        networkProvidersLabel.text = providers
        countryFlagImageView.image = flag
        checkmarkImageView.isHidden = !isSupported
    }
}

