//
//  SMSItem.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 27.02.24.
//

import UIKit
import SnapKit
import BakcellUIKit

class SMSItem: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    private lazy var smsStackView: UIStackView = createSectionStackView()
    
    private func createSectionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }
    
    private lazy var smsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "İnternet"
        label.textColor = .black
        return label
    }()
    
    private lazy var smsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cellcall")
        return imageView
    }()
    
    private lazy var smsIn: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Daxil olan"
        label.textColor = .black
        return label
    }()
    
    private lazy var smsInAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Pulsuz"
        label.textColor = adaptiveColor(.main)
        return label
    }()
    
    private lazy var smsOut: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Çıxan"
        label.textColor = .black
        return label
    }()
    
    private lazy var smsOutAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "0.39 ₼ /dəq"
        label.textColor = .black
        return label
    }()
    
    private lazy var smsHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.addArrangedSubview(smsImageView)
        stackView.addArrangedSubview(smsTitleLabel)
        return stackView
    }()
    
    private lazy var smsInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(smsIn)
        stackView.addArrangedSubview(smsInAmount)
        return stackView
    }()
    
    private lazy var smsOutStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(smsOut)
        stackView.addArrangedSubview(smsOutAmount)
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
        self.addSubview(smsStackView)
        smsStackView.addArrangedSubview(smsHeaderStackView)
        smsStackView.addArrangedSubview(smsInStackView)
        smsStackView.addArrangedSubview(smsOutStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        smsStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        smsImageView.snp.updateConstraints { make in
            make.width.equalTo(24)
        }
        
        smsHeaderStackView.snp.updateConstraints { make in
            make.height.equalTo(24)
        }
    }
}


extension SMSItem {
    func configure(with item: SMSSection) {
        smsTitleLabel.text = item.title
        smsImageView.image = UIImage(named: item.imageName)
        smsIn.text = "Daxil olan"
        smsInAmount.text = item.incomingCost
        smsOut.text = "Çıxan" 
        smsOutAmount.text = item.outgoingCost
    }
}
