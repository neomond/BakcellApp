//
//  PriceItemsView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 29.02.24.
//

import UIKit
import BakcellUIKit
import SnapKit

class PriceItemsView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    private lazy var itemWithImgStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.text = "Qiyməti"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var itemTitleAmount: UILabel = {
        let label = UILabel()
        label.text = "3.00₼"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var backImgView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.grayPrimary)
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "coin")
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(itemWithImgStackView)
        addSubview(itemTitleAmount)
        
        backImgView.addSubview(itemImageView)
        itemWithImgStackView.addArrangedSubview(backImgView)
        itemWithImgStackView.addArrangedSubview(itemTitle)
        
        itemWithImgStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
        
        backImgView.snp.updateConstraints { make in
            make.width.height.equalTo(40)
        }
        
        itemImageView.snp.updateConstraints { make in
            make.center.equalTo(backImgView)
            make.width.height.equalTo(20)
        }
        
        itemTitleAmount.snp.updateConstraints { make in
//            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(11)
            make.trailing.equalToSuperview().inset(16)
         
        }
    }
}
