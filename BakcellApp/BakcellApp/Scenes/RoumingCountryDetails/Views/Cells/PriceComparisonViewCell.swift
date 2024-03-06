//
//  PriceComparisonViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit


class PriceComparisonViewCell: UIView, ThemeableView {
//    static var reuseIdentifier = "PriceComparisonViewCell"
//
    
    var theme: ThemeProvider = App.theme
    
    let titles = ["Operatorlar", "Daxil olan zənglər", "Çıxan zənglər", "Daxil olan SMS", "Çıxan SMS", "İnternet sərfiyyatı", "Şəbəkə"]
    let operator1 = ["TT Mobile", "0.39 ₼ / dəq", "0.99 ₼ / dəq", "Pulsuz", "0.19 ₼ / sms", "-", "2G, 3G, 4G"]
    let operator2 = ["Turkcell", "0.39 ₼ / dəq", "0.99 ₼ / dəq", "Pulsuz", "0.19 ₼ / sms", "-", "2G, 3G, 4G"]
    
    private lazy var contentHStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = adaptiveColor(.grayPrimary)
        view.spacing = 4
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var priceTableHeaders: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        view.layer.borderColor = adaptiveColor(.borderTable).cgColor
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var operatorsPricesHStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillEqually
        view.layer.cornerRadius = 12
        view.layer.borderColor = adaptiveColor(.borderTable).cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = adaptiveColor(.grayPrimary)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var operatorPriceTableView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical


        view.backgroundColor = .clear
        
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var operatorPriceTableView2: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        self.backgroundColor = .clear
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
       
        self.addSubview(self.contentHStackView)
        
        
        for (index, title) in self.titles.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
          
            
            if index % 2 == 0 {
                view.backgroundColor = adaptiveColor(.grayPrimary)
            }
            else {
                view.backgroundColor = adaptiveColor(.whitePrimary)
            }
            self.priceTableHeaders.addArrangedSubview(view)
        }
        for (index, title) in self.operator1.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
            view.isOperationHeaderView = true
            if index != 0 {
                view.isChildView = true
            }
            if index % 2 != 0 {
                view.backgroundColor = adaptiveColor(.grayPrimary)
            }
            else {
                view.backgroundColor = adaptiveColor(.whitePrimary)
            }
            self.operatorPriceTableView.addArrangedSubview(view)
        }
        
        for (index, title) in self.operator2.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
            view.isOperationHeaderView = true
            if index != 0 {
                view.isChildView = true
            }
            if index % 2 != 0 {
                view.backgroundColor = adaptiveColor(.grayPrimary)
            }
            else {
                view.backgroundColor = adaptiveColor(.whitePrimary)
            }
            self.operatorPriceTableView2.addArrangedSubview(view)
        }
        
        self.operatorsPricesHStackView.addArrangedSubview(self.operatorPriceTableView)
        self.operatorsPricesHStackView.addArrangedSubview(self.operatorPriceTableView2)
        
        self.contentHStackView.addArrangedSubview(self.priceTableHeaders)
        
        self.contentHStackView.addArrangedSubview(self.operatorsPricesHStackView)
        self.updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentHStackView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalToSuperview()

        }
        
        self.priceTableHeaders.snp.updateConstraints { make in
            make.width.equalTo(120)
        }
        
    }
}
