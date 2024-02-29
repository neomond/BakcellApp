//
//  CellCallItem.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 27.02.24.
//

import UIKit
import BakcellUIKit

class CellCallItem: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    //    -----------------------------
    private lazy var callsStackView: UIStackView = createSectionStackView()
    
    private func createSectionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }
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
        stackView.addArrangedSubview(cellcallImageView)
        stackView.addArrangedSubview(cellcallTitleLabel)
        return stackView
    }()
    
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupViews() {
        self.addSubview(callsStackView)
        callsStackView.addArrangedSubview(headerStackView)
        callsStackView.addArrangedSubview(cellInStackView)
        callsStackView.addArrangedSubview(cellOutStackView)
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.cellcallImageView.snp.updateConstraints { make in
            make.width.equalTo(24)
        }
        self.headerStackView.snp.updateConstraints { make in
            make.height.equalTo(24)
        }
    }
}
