//
//  SectionHeaderView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellUIKit

class SectionHeaderView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme

    private let titleLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .left
           label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
           return label
       }()
    
    init(title: String) {
           super.init(frame: .zero)
           addSubview(titleLabel)
           titleLabel.text = title
           titleLabel.textColor = adaptiveColor(.black)

           setupConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setupConstraints() {
           titleLabel.snp.updateConstraints { make in
               make.leading.equalToSuperview().offset(16)
               make.trailing.equalToSuperview().offset(-16)
               make.top.equalToSuperview().offset(5)
               make.bottom.equalToSuperview().offset(-5)
           }
       }
}
