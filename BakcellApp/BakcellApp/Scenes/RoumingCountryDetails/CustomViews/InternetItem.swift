//
//  InternetItem.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 03.03.24.
//

import UIKit
import SnapKit
import BakcellUIKit

class InternetItem: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    private lazy var internetStackView: UIStackView = createSectionStackView()
    
    private func createSectionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }
    
    private lazy var internetTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "İnternet"
        label.textColor = .black
        return label
    }()
    
    private lazy var internetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cellcall")
        return imageView
    }()
    
    private lazy var internetIn: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Daxil olan"
        label.textColor = .black
        return label
    }()
    
    private lazy var internetInAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Pulsuz"
        label.textColor = .black
        return label
    }()
    
    private lazy var internetOut: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Çıxan"
        label.textColor = .black
        return label
    }()
    
    private lazy var internetOutAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "0.39 ₼ /dəq"
        label.textColor = .black
        return label
    }()
    
    private lazy var internetHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.addArrangedSubview(internetImageView)
        stackView.addArrangedSubview(internetTitleLabel)
        return stackView
    }()
    
    private lazy var internetInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(internetIn)
        stackView.addArrangedSubview(internetInAmount)
        return stackView
    }()
    
    private lazy var internetOutStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(internetOut)
        stackView.addArrangedSubview(internetOutAmount)
        return stackView
    }()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(internetStackView)
        internetStackView.addArrangedSubview(internetHeaderStackView)
        internetStackView.addArrangedSubview(internetInStackView)
        internetStackView.addArrangedSubview(internetOutStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        internetStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        internetImageView.snp.updateConstraints { make in
            make.width.equalTo(24)
        }
        
        internetHeaderStackView.snp.updateConstraints { make in
            make.height.equalTo(24)
        }
    }
}


extension InternetItem {
    func configure(with item: InternetSection) {
        internetTitleLabel.text = item.title
        internetImageView.image = UIImage(named: item.imageName)
        internetIn.text = "Sərfiyyat"
        internetInAmount.text = item.usageDetails
        internetOut.text = "Şəbəkə"
        internetOutAmount.text = item.networkTypes
    }
}
