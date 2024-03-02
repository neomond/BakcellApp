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
    

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var servicesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    
    private lazy var cellCallItem: CellCallItem = {
           let item = CellCallItem()
           return item
       }()
    
    
    private lazy var smsItem: SMSItem = {
           let item = SMSItem()
           return item
       }()
    
    
    private lazy var internetItem: InternetItem = {
        let item = InternetItem()
        return item
    }()

    
// GRAY BORDER
    private lazy var borderedView: BorderedView = {
        let view = BorderedView()
        return view
    }()
    
    private lazy var borderedView2: BorderedView = {
        let view = BorderedView()
        return view
    }()
   
    
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
        contentStackView.addArrangedSubview(servicesStackView)
        
        servicesStackView.addArrangedSubview(cellCallItem)
        
        servicesStackView.addArrangedSubview(borderedView)
        
        servicesStackView.addArrangedSubview(smsItem)
        
        servicesStackView.addArrangedSubview(borderedView2)
        servicesStackView.addArrangedSubview(internetItem)
        
        self.backView.addSubview(contentStackView)
        self.contentView.addSubview(backView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backView.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-8)

        }
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

        self.borderedView.snp.updateConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview()
        }
        self.borderedView2.snp.updateConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    // Configure cell with data
    func configure(with package: RoamingPackageModel) {
        titleLabel.text = package.packageName
        cellCallItem.configure(with: package.callSection)
        smsItem.configure(with: package.smsSection)
        internetItem.configure(with: package.internetSection)
    }

}


