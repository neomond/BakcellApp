//
//  RoumingTableViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 27.02.24.
//


import UIKit
import SnapKit

class RoumingTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "RoumingTableViewCell"
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "TT MobileB"
        label.textColor = .black
        return label
    }()
    
    
//    -----------------------------
    private lazy var cellcallTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Zənglər"
        label.textColor = .black
        return label
    }()
    
    
    private lazy var cellcallImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cellcall")
        return imageView
    }()
    
    
    private lazy var cellIn: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Daxil olan"
        label.textColor = .black
        return label
    }()
    
    
    private lazy var cellInAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "0.39 ₼ /dəq"
        label.textColor = .black
        return label    }()
    
    
    private lazy var cellOut: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Çıxan"
        label.textColor = .black
        return label
    }()
    
    
    private lazy var cellOutAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "0.39 ₼ /dəq"
        label.textColor = .black
        return label
    }()
    
    
    private lazy var cellInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(cellIn)
        stackView.addArrangedSubview(cellInAmount)
        return stackView
    }()
    
    
    private lazy var cellOutStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
    
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(cellOut)
        stackView.addArrangedSubview(cellOutAmount)
        return stackView
    }()
    
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
//        stackView.distribution = .fill
        stackView.addArrangedSubview(cellcallImageView)
        stackView.addArrangedSubview(cellcallTitleLabel)
        return stackView
    }()
    

//    -----------------------------
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    
    private lazy var callsStackView: UIStackView = createSectionStackView()
    private lazy var smsStackView: UIStackView = createSectionStackView()
    private lazy var internetStackView: UIStackView = createSectionStackView()
    
    
    private func createSectionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        setupCell()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCell() {
        
        self.contentStackView.addArrangedSubview(self.titleLabel)
        contentStackView.addArrangedSubview(callsStackView)
        contentStackView.addArrangedSubview(smsStackView)
        contentStackView.addArrangedSubview(internetStackView)
        
        callsStackView.addArrangedSubview(headerStackView)
        callsStackView.addArrangedSubview(cellInStackView)
        callsStackView.addArrangedSubview(cellOutStackView)
        
        self.backView.addSubview(contentStackView)
        self.contentView.addSubview(backView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backView.snp.updateConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)

        }
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        self.cellcallImageView.snp.updateConstraints { make in
            make.width.equalTo(24)
        }
        self.headerStackView.snp.updateConstraints { make in
            make.height.equalTo(24)
        }
    }
    
    // Configure cell with data
        func configure(with model: RoamingDetail) {
            titleLabel.text = model.title
        }
}

// Model struct for the data
struct RoamingDetail {
    let title: String
    let subtitle: String
    let detail: String
    let iconName: String
    let isFree: Bool
}


