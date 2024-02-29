//
//  PackagesView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 29.02.24.
//


import UIKit
import SnapKit
import BakcellUIKit

class PackagesView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    
    private lazy var pckgsHeader: UILabel = {
        let label = UILabel()
        label.text = "Günlük"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    
    private lazy var pckgsTitle: UILabel = {
        let label = UILabel()
        label.text = "100 MB"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    
    private lazy var pckgsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 24
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        stackView.clipsToBounds = true
        stackView.axis = .vertical

        stackView.addArrangedSubview(pckgsHeader)
        stackView.addArrangedSubview(pckgsTitle)
        return stackView
    }()
    
    
    private lazy var internetItemsView: InternetItemsView = {
           let view = InternetItemsView()
           return view
       }()
    
    
    private lazy var whatsappItemsView: WhatsAppItemsView = {
           let view = WhatsAppItemsView()
           return view
       }()
    
    private lazy var durationItemsView: DurationItemView = {
           let view = DurationItemView()
           return view
       }()
    
    private lazy var priceItemsView: PriceItemsView = {
           let view = PriceItemsView()
           return view
       }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        self.addSubview(pckgsStackView)
        pckgsStackView.addArrangedSubview(pckgsHeader)
        pckgsStackView.addArrangedSubview(pckgsTitle)
        pckgsStackView.addArrangedSubview(internetItemsView)
        pckgsStackView.addArrangedSubview(whatsappItemsView)
        pckgsStackView.addArrangedSubview(durationItemsView)
        pckgsStackView.addArrangedSubview(priceItemsView)
        
        
        self.pckgsStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
     
        self.pckgsHeader.snp.updateConstraints { make in
            make.top.left.equalToSuperview().offset(16)
            make.bottom.equalTo(pckgsTitle.snp.top).offset(-8)
        }
      
    }
}
