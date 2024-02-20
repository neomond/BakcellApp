//
//  AllIncludedPackagesCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 20.02.24.
//

import UIKit
import SnapKit
import BakcellUIKit


class AllIncludedPackagesCell: UITableViewCell, ThemeableView {
    
    
    var theme: ThemeProvider = App.theme
    
    private lazy var containerView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = adaptiveColor(.whitePrimary)
        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        return contentView
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Aylıq hamısı daxil"
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        let fullPrice = "30.00 ₼ "
        let timePeriod = "/ Ay"
        
        let fullPriceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 17),
            .foregroundColor: adaptiveColor(.black)
        ]
        let attributedString = NSMutableAttributedString(string: fullPrice, attributes: fullPriceAttributes)
        
        let timePeriodAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .foregroundColor: adaptiveColor(.grayInput)
        ]
        let timePeriodAttributedString = NSAttributedString(string: timePeriod, attributes: timePeriodAttributes)
        
        attributedString.append(timePeriodAttributedString)
        label.attributedText = attributedString
        return label
    }()
    
    
    private lazy var internetQuotaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.text = "İnternet"
        return label
    }()
    
    
    private lazy var callQuotaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.text = "Zəng"
        return label
    }()
    
    
    private lazy var smsQuotaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.text = "SMS"
        return label
    }()
    
    
    private lazy var addAction: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add_icon"), for: .normal)
        button.backgroundColor = adaptiveColor(.main)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = adaptiveColor(.main).cgColor
        return button
    }()
    
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    
    private lazy var  horizontalStackView:UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 8
        return horizontalStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    
    private func addSubviews() {
        self.addSubview(containerView)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        
        horizontalStackView.addArrangedSubview(infoStackView)
        horizontalStackView.addArrangedSubview(addAction)
        
        infoStackView.addArrangedSubview(internetQuotaLabel)
        infoStackView.addArrangedSubview(callQuotaLabel)
        infoStackView.addArrangedSubview(smsQuotaLabel)
        
        stackView.addArrangedSubview(horizontalStackView)
       
        self.updateConstraints()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        containerView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(-4)
        }
        
        stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
        }

        priceLabel.snp.updateConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(containerView.snp.left).offset(16)
        }
        
        infoStackView.snp.updateConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.top.bottom.equalTo(horizontalStackView)
        }
        
        horizontalStackView.snp.updateConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
        }
        
        addAction.snp.updateConstraints { make in
            make.leading.equalTo(infoStackView.snp.trailing).offset(16)
            make.centerY.equalTo(horizontalStackView.snp.centerY)
            make.height.width.equalTo(32)
        }
    }
    
    
    func configure(with model: AllIncludedModel) {
        titleLabel.text = model.title
    }
}
