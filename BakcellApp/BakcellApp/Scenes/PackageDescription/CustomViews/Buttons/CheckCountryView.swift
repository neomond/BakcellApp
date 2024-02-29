//
//  CheckCountryView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 29.02.24.
//

import UIKit
import BakcellUIKit
import SnapKit

class CheckCountryButton: UIButton, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    // MARK: - Subviews
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "direction")
        return imageView
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Ölkə yoxla"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var subtitleLbl: UILabel = {
        let label = UILabel()
        label.text = "20 ölkədə dəstəklənir"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var searchIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        return view
    }()
    
    private lazy var directionIconBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.grayPrimary)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(directionIconBackgroundView)
        directionIconBackgroundView.addSubview(iconImageView)
        
        let textStackView = UIStackView(arrangedSubviews: [titleLbl, subtitleLbl])
        textStackView.axis = .vertical
        textStackView.spacing = 2
        containerView.addSubview(textStackView)
        
        containerView.addSubview(searchIconImageView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        directionIconBackgroundView.snp.makeConstraints { make in
            make.left.equalTo(containerView).offset(16)
            make.centerY.equalTo(containerView)
            make.width.height.equalTo(40)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(directionIconBackgroundView)
            make.width.height.equalTo(24)
        }
        
        let textStackView = containerView.subviews.first { $0 is UIStackView } as? UIStackView
        textStackView?.snp.makeConstraints { make in
            make.left.equalTo(directionIconBackgroundView.snp.right).offset(12)
            make.centerY.equalTo(containerView)
        }
        
        searchIconImageView.snp.makeConstraints { make in
            make.right.equalTo(containerView).offset(-16)
            make.centerY.equalTo(containerView)
            make.width.height.equalTo(24)
        }
    }
}

