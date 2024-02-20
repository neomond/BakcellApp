//
//  CardCollectionViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 19.02.24.
//

import UIKit
import BakcellUIKit

class CardCollectionViewCell: UICollectionViewCell, ThemeableView {
    static  var reuseIdentifier = "CardCollectionViewCell"
    
    
    var theme: ThemeProvider = App.theme
    
    private lazy var containerView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = adaptiveColor(.whitePrimary)
        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        return contentView
    }()
     
    
    private lazy var dataAmountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    
    private lazy var dataUnitLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    
    private lazy var freeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Pulsuz"
        return label
    }()
    
    
    private lazy var whatsappImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "whatsapp")
        return imageView
    }()
    
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        
        let fullPrice = "3.00 ₼ "
        let timePeriod = "/ Gün"
        
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

    
    private lazy var internetLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Internet"
        label.textColor = adaptiveColor(.black)
        label.backgroundColor = adaptiveColor(.grayPrimary)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
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
    
    
    func configureCell(type: PackageCellType, dataAmount: String, priceText: String, priceTimePeriod: String, labelText: String) {
       
        let isInternetPackage = type == .internet
        whatsappImageView.isHidden = !isInternetPackage
        freeLabel.isHidden = !isInternetPackage

        dataUnitLabel.text = isInternetPackage ? "MB" : "dəq"
        
        dataAmountLabel.text = dataAmount
        
        internetLabel.text = labelText

        let fullPriceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 17),
            .foregroundColor: adaptiveColor(.black)
        ]
        let attributedString = NSMutableAttributedString(string: priceText, attributes: fullPriceAttributes)
        
        let timePeriodAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .foregroundColor:  adaptiveColor(.grayInput)
        ]
        let timePeriodAttributedString = NSAttributedString(string: priceTimePeriod, attributes: timePeriodAttributes)
        
        attributedString.append(timePeriodAttributedString)
        priceLabel.attributedText = attributedString
        
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        self.addSubview(containerView)
        
        containerView.addSubview(dataAmountLabel)
        containerView.addSubview(dataUnitLabel)
        containerView.addSubview(freeLabel)
        containerView.addSubview(whatsappImageView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(internetLabel)
        containerView.addSubview(addAction)
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        containerView.snp.updateConstraints { make in
            make.left.top.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(-12)
            make.bottom.equalToSuperview()
        }
        
        dataAmountLabel.snp.updateConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.left.equalTo(containerView.snp.left).offset(16)
        }
        
        dataUnitLabel.snp.updateConstraints { make in
            make.centerY.equalTo(dataAmountLabel.snp.centerY).offset(4)
            make.left.equalTo(dataAmountLabel.snp.right).offset(4)
        }
        
        whatsappImageView.snp.updateConstraints { make in
            make.top.equalTo(dataAmountLabel.snp.bottom).offset(8)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        freeLabel.snp.updateConstraints { make in
            make.centerY.equalTo(whatsappImageView.snp.centerY)
            make.left.equalTo(whatsappImageView.snp.right).offset(8)
        }
        
        priceLabel.snp.updateConstraints { make in
            make.bottom.equalTo(internetLabel.snp.top).offset(-12)
            make.left.equalTo(containerView.snp.left).offset(16)
        }
        
        internetLabel.snp.updateConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(16)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.bottom.equalToSuperview().inset(16)
            make.width.equalTo(55)
            make.height.equalTo(24)
        }
        
        addAction.snp.updateConstraints { make in
            make.right.equalTo(containerView.snp.right).offset(-16)
            make.bottom.equalTo(containerView.snp.bottom).offset(-16)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
    }
    
    
    func configure(with title: String) {
        dataAmountLabel.text = title
    }
}





//    private lazy var stackView: UIStackView = {
//            let stack = UIStackView()
//            stack.axis = .vertical
//            stack.alignment = .leading
//            stack.distribution = .equalSpacing
//            stack.spacing = 8
//            return stack
//        }()